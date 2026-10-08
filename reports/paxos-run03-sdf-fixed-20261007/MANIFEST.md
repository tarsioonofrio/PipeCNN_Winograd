# Arquivos RTL e resultados trazidos da Paxos

Run remoto: `/sim/tarsio/PipeCNN_Winograd/project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032/runs/memread-f43-i8-l032-20261007T-run03-sdf-fixed`

## RTL de entrada

Os arquivos-fonte RTL usados pela fatia e seu testbench já estão no checkout local. Os hashes abaixo foram comparados com os arquivos da Paxos:

| Arquivo local | SHA-256 |
|---|---|
| `project/device/experiments/opencl_memread_compute/pipecnn_memread_conv_slice.sv` | `f9983a4d159a51b5cd0e1d2a17312cbad490a85cbb2f0af9ec9c8164a1f5bd14` |
| `project/device/experiments/opencl_memread_compute/pipecnn_memread_compute.sv` | `d0cfb98884171a306954b9017369a93af59fc96308ba26b22ca454c19eccc9f8` |
| `project/device/experiments/opencl_memread_compute/pipecnn_conv_accumulator_postprocess.sv` | `18876ab1bbab25049f5906ce98df75da496bd01315d028e26fd8a76c7fd378d3` |
| `project/device/experiments/opencl_memread_compute/tb_memread_conv_slice.sv` | `a6f7434ec05581f8f85e9bfe30d8fe514841c26bb6c8bd6bce288c22d7fb757d` |

## Saídas da síntese run02 já no checkout

Diretório: `reports/paxos-run02-interim-20261007T172639/`

- `pipecnn_memread_conv_slice_logic_mapped.v` — netlist RTL mapeado; SHA-256 `3312402e3dae1f9b94cf813201d1379592515878cf0e6d3e2756e409df00aff3`.
- `pipecnn_memread_conv_slice_nominal.sdf` — backannotation SDF; SHA-256 `579611bec1d4ba8e6f9d7d51ff5c9791714b4c4717196c932a39aef59f12b99c`.
- Os relatórios de área, gates, timing e estimativa vectorless também estão nesse diretório.

## Simulação run03 copiada

Diretório: `reports/paxos-run03-sdf-fixed-20261007/sim/`

- `dut.vcd` — SHA-256 `d924c4167478d3b565d13451479748c09f923eef191c2eb2be4a2f95de788809`.
- `xrun.log` — SHA-256 `02bc6c1c82fac3a6f917f169d502702a08ea361347075503e042dd0e3f6e427c`; a simulação terminou com `PASS` aos 150 ns.
- `sdf.log` — registra MTM `TYPICAL`, escala `1:1:1` e `FROM_MAXIMUM`.

Limites: apenas 33,28% dos timing checks SDF foram anotados (174.844 de 525.428). Xcelium também emitiu avisos `PRPASZ` para vetores packed largos não sondados. Portanto, o VCD foi preservado, mas sua cobertura ainda não está validada para uma análise Joules baseada em atividade.
