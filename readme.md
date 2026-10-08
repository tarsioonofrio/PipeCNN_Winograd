
# PipeCNN_Winograd

## About 

**PipeCNN_Winograd** is an OpenCL-based FPGA accelerator which can run the YOLOv2 model very efficiently. It was originally forked from **PipeCNN** (https://github.com/doonny/PipeCNN) and has been modified significantly ever since. Winnograd algorithm is employed to accelerate convolution calculation in FPGA. The design solves the unaligned memory access challenge caused by Winnograd algorithm, makes full use of the available memory access bandwidth and utilizes all available DSP resources. Parallelism is exploited in various dimensions for optimal performance. PipeCNN_Winograd only supports the YOLOv2 model at present. To our knowledge, this is the first open source project to implement Winograd algorithm in FPGA with OpenCL language.

## How to Use

Clone PipeCNN_Winograd project from [github](https://github.com/PipeCNN_Winograd). 
1) Put testing pictures into ./data/picture.

2) Pre-process model weights with the weight_gen.sh script in ./data/weight;

3) Compile design with the run_fpga.sh script in ./project, it will take around one hour to finish all the compilations. Finally, there will generate file "conv_pipe.aocx"

4) Test the design with FPGA;
        ./project/fpga_test.sh

This project is tested with Intel Arrial 10 FPGA and Intel OpenCL SDK v18.0/v19.1.

## Citation
Please kindly cite our work of PipeCNN-Winograd if it helps your research:
```
Anrong Yang, Yuanhui Li, Hongqiao Shu, Jianlin Deng, Chuanzhao Ma, Zheng Li and Qigang Wang, "An OpenCL-Based FPGA Accelerator for Compressed YOLOv2", FPT 2019.
```

## Reports and experiment results

Project-specific reports and experiment notes are kept in `reports/`. Start
with [`reports/README.md`](reports/README.md) for the inventory and the scope
of each result.

The main AOCL full-kernel compilation report is generated at
`project/conv_pipe/reports/report.html` by `project/run_fpga.sh`. Supporting
compiler output and intermediates are under `project/conv_pipe/`; the generated
FPGA image is `project/conv_pipe.aocx`. Preserve a run before rebuilding,
because `make clean` removes the generated compiler project. Archive compiler
reports under a new descriptive directory in `reports/`, together with the
source revision, AOCL version, board/part and exact command used.

An isolated Genus/Xcelium/Joules configuration, if executed, stores its raw
evidence under
`project/device/RTL/synthesis/<configuration>/`: synthesis reports and mapped
netlist under `logical/results/`, simulation logs under `sim/`, and the power
summary at `power/power_evaluation.txt`. These results characterize only the
specified RTL slice and testbench; they are not full-kernel PipeCNN power or
performance results. Likewise, IP-generation reports under
`project/device/RTL/mult_add_fix8bx16bx4/` do not describe the complete
accelerator.

Keep compiler estimates, source-level experiment results, IP-generation
reports, and physical board measurements separate. A generated `.aocx` image
is a build artifact, not a report; record its checksum with the archived run
and version the binary only when the project specifically requires it.

