#!/usr/bin/env python3
"""Reproduce the host-side scalar parameters passed to OpenCL memRead.

This reads the active layer_config table and the architecture macros; it is a
configuration aid, not a replacement for the OpenCL host or AOCL schedule.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path


HERE = Path(__file__).resolve().parent
PROJECT = HERE.parents[2]
HOST = PROJECT / "host"
DEVICE = PROJECT / "device"


def active_source(path: Path) -> str:
    text = path.read_text()
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    return "\n".join(line.split("//", 1)[0] for line in text.splitlines())


def macro_values(path: Path, names: tuple[str, ...]) -> dict[str, int]:
    source = active_source(path)
    values: dict[str, int] = {}
    for name in names:
        match = re.search(rf"^\s*#define\s+{name}\s+(\d+)\b", source, re.M)
        if not match:
            raise ValueError(f"active #define {name} not found in {path}")
        values[name] = int(match.group(1))
    return values


def layer_rows(path: Path) -> list[list[int]]:
    source = active_source(path)
    match = re.search(
        r"unsigned\s+layer_config\s*\[\]\[NUM_CONFIG_ITEM\]\s*=\s*\{(.*?)\};",
        source,
        re.S,
    )
    if not match:
        raise ValueError(f"active layer_config initializer not found in {path}")

    body = match.group(1)
    rows: list[list[int]] = []
    depth = 0
    row_start: int | None = None
    for offset, char in enumerate(body):
        if char == "{":
            if depth == 0:
                row_start = offset + 1
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0 and row_start is not None:
                row = [int(value) for value in re.findall(r"\d+", body[row_start:offset])]
                if len(row) != 27:
                    raise ValueError(f"expected 27 fields in layer row, got {len(row)}")
                rows.append(row)
                row_start = None
            elif depth < 0:
                raise ValueError("unbalanced braces in layer_config")
    if depth != 0:
        raise ValueError("unbalanced braces in layer_config")
    return rows


def ceil_div(numerator: int, denominator: int) -> int:
    if numerator < 0 or denominator <= 0:
        raise ValueError("ceil_div requires numerator >= 0 and denominator > 0")
    return (numerator + denominator - 1) // denominator


def derive_layers() -> list[dict[str, int | bool]]:
    params = macro_values(
        DEVICE / "hw_param.cl",
        (
            "VEC_SIZE",
            "W_VEC_SIZE",
            "LANE_NUM",
            "CONV_GP_SIZE_X",
            "CONV_GP_SIZE_Y",
        ),
    )
    layers = layer_rows(HOST / "layer_config.h")
    host = active_source(HOST / "main.cpp")
    layer_num_match = re.search(r"^\s*#define\s+LAYER_NUM\s+(\d+)\b", host, re.M)
    if not layer_num_match:
        raise ValueError("active LAYER_NUM not found in project/host/main.cpp")
    active_layer_num = int(layer_num_match.group(1))
    if len(layers) != active_layer_num:
        raise ValueError(
            f"layer_config has {len(layers)} rows but active LAYER_NUM is {active_layer_num}"
        )

    vec = params["VEC_SIZE"]
    w_vec = params["W_VEC_SIZE"]
    lanes = params["LANE_NUM"]
    group_x_size = params["CONV_GP_SIZE_X"]
    group_y_size = params["CONV_GP_SIZE_Y"]

    derived: list[dict[str, int | bool]] = []
    for index, original in enumerate(layers):
        # config_item positions from main.cpp's enum config_item.
        row = original.copy()
        data_w, data_h, weight_h, weight_n, weight_m = row[1], row[2], row[5], row[6], row[7]
        conv_x, conv_y, stride, padding, weight_w = row[10], row[11], row[13], row[14], row[4]
        pool_on, pool_x, pool_y, pool_z = row[18], row[19], row[20], row[21]

        # Reproduce the field normalization in main.cpp before kernel arguments
        # are derived. The first layer is padded to VEC_SIZE later in main.cpp.
        row[1] = ceil_div(data_w + 2 * padding, group_x_size) * group_x_size
        row[7] = ceil_div(weight_m, lanes) * lanes
        if index == 0:
            row[6] = ceil_div(weight_n, vec) * vec
            row[3] = row[6]

        padded_data_w = row[1]
        padded_weight_n = row[6]
        padded_weight_m = row[7]
        group_num_x = ceil_div(conv_x + 2 * padding, group_x_size)
        group_num_y = ceil_div(conv_y, group_y_size)
        conv_row_rem = (conv_x + 2 * padding) % group_x_size
        weight_dim4_div_lane = padded_weight_m // lanes
        conv_win_size = (weight_h * padded_weight_n) // vec
        group_num_mul_win_size = (
            weight_dim4_div_lane * group_num_x * group_num_y + 2
        ) * conv_win_size

        next_layer_padding = layers[index + 1][14] if index + 1 < len(layers) else 0
        out_dim1_orig = pool_x if pool_on else conv_x
        out_dim2 = pool_y if pool_on else conv_y
        out_dim3 = pool_z if pool_on else row[12]
        memwr_scal = 2 if index == 0 else lanes // vec
        if out_dim3 % lanes:
            memwr_scal_rem_z = (out_dim3 % lanes) // vec
        else:
            memwr_scal_rem_z = lanes // vec
        q_vec = 2 if pool_on else 4
        start_size_x = q_vec + next_layer_padding
        rem_size_x = (
            q_vec + next_layer_padding
            if out_dim1_orig % q_vec == 0
            else out_dim1_orig % q_vec + next_layer_padding
        )
        out_dim1_div_q_vec = ceil_div(out_dim1_orig, q_vec)
        out_dim1 = (
            ceil_div(out_dim1_orig + 2 * next_layer_padding, 4) * 4
            if index + 1 < len(layers)
            else out_dim1_orig
        )
        if out_dim3 % lanes:
            memwr_output_num = (
                (out_dim1_orig + 2 * next_layer_padding) * out_dim2 * out_dim3
            ) // vec
        else:
            memwr_output_num = (
                (out_dim1_orig + 2 * next_layer_padding)
                * memwr_scal
                * out_dim2
                * out_dim3
            ) // lanes
        dim_z_edge_num = (
            (out_dim1_orig + 2 * next_layer_padding)
            * memwr_scal
            * out_dim2
            * (out_dim3 // lanes)
        )

        width_checks = {
            "group_num_x": (group_num_x, 8),
            "group_num_y": (group_num_y, 32),
            "weight_dim3": (padded_weight_n, 16),
            "weight_dim4_div_lane": (weight_dim4_div_lane, 16),
            "win_size": (conv_win_size, 16),
            "conv_row_rem": (conv_row_rem, 8),
            "group_num_mul_win_size": (group_num_mul_win_size, 32),
        }
        for name, (value, bits) in width_checks.items():
            if not 0 <= value < (1 << bits):
                raise ValueError(
                    f"layer {index + 1}: {name}={value} does not fit uint{bits}"
                )

        derived.append(
            {
                "layer": index + 1,
                "data_dim1": padded_data_w,
                "data_dim2": data_h,
                "data_dim1xdim2": padded_data_w * data_h,
                "weight_dim1": weight_w,
                "weight_dim3": padded_weight_n,
                "weight_dim4_div_lane": weight_dim4_div_lane,
                "win_size": conv_win_size,
                "win_size_y": weight_h,
                "group_size_x": group_x_size,
                "stride": stride,
                "group_num_x": group_num_x,
                "group_num_y": group_num_y,
                "conv_row_rem": conv_row_rem,
                "conv_row_rem_flag": weight_w == 3 and conv_row_rem in (1, 2),
                "conv_loop_cnt": conv_win_size,
                "group_num_mul_win_size": group_num_mul_win_size,
                "fc_en": weight_w == 1,
                "bypass": not bool(pool_on),
                "line_size": conv_y,
                "col_size": ceil_div(conv_x, w_vec - 2),
                "out_num": memwr_output_num,
                "q_vec": q_vec,
                "rem_size_x": rem_size_x,
                "start_size_x": start_size_x,
                "out_dim1_div_q_vec": out_dim1_div_q_vec,
                "next_layer_padding": next_layer_padding,
                "out_dim1": out_dim1,
                "out_dim2": out_dim2,
                "out_dim1xdim2": out_dim1 * out_dim2,
                "scal": memwr_scal,
                "scal_rem_z": memwr_scal_rem_z,
                "scalxq_vec": memwr_scal * q_vec,
                "scalxrem_size_x": memwr_scal * rem_size_x,
                "scalxstart_size_x": memwr_scal * start_size_x,
                "scal_rem_zxq_vec": memwr_scal_rem_z * q_vec,
                "scal_rem_zxrem_size_x": memwr_scal_rem_z * rem_size_x,
                "scal_rem_zxstart_size_x": memwr_scal_rem_z * start_size_x,
                "dim_z_edge_num": dim_z_edge_num,
            }
        )

    return derived


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--layer", type=int, help="one-based active YOLO layer number")
    parser.add_argument("--all", action="store_true", help="emit every active layer")
    args = parser.parse_args()
    layers = derive_layers()
    if args.layer is not None:
        if not 1 <= args.layer <= len(layers):
            parser.error(f"--layer must be between 1 and {len(layers)}")
        output = layers[args.layer - 1]
    elif args.all:
        output = layers
    else:
        parser.error("provide --layer N or --all")
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()
