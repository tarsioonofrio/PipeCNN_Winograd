# RTL gerado pelo smoke test PoCL-HLS

Este diretório arquiva a saída produzida na Paxos em 2026-10-08 pelo smoke
test descrito em `../README.md`. Os quatro arquivos Verilog, o C++ HLS, o MLIR
e os logs de geração e co-simulação estão aqui. `SHA256SUMS` registra os
hashes dos RTL, intermediários C++/MLIR e logs.

## Origem

- Cache original:
  `/sim/tarsio/pocl_hls_rtl/pocl-cache-integrated2/KG/CPAADGNKGBHBBODMBJKJGLDBLJOFAJNGAMGDI/command_buffer/1-1-1-goffs0-smallgrid/vitis_project_command_buffer/solution1/syn/verilog/`
- Toolchain: PoCL-HLS `e72cb721b6c02b208fee500f43fcfd77f32b83f0`, Hida/ScaleHLS
  `3929a7f80ecd18a21a6137e7355e8bb06652a8b6`, Vitis HLS 2024.2.
- Parâmetros do Vitis HLS: fluxo `vivado`, part `xc7z020clg400-1`.
- Kernel: o smoke OpenCL de quatro elementos; não é o `conv_pipe.cl`.

## Limites do resultado

`pocl-hls-integrated2.log` registra `csynth_design` e a mensagem `RTL-only
mode: generated Verilog`. Depois dessa etapa, o processo PoCL continuou para
carregar o programa no emulador e abortou durante codegen LLVM X86 com
`free(): invalid next size`.

O log `vitis-cosim-smoke-20261008-run1.log` registra C simulation e C/RTL
co-simulation com XSIM; ambas verificaram `out[0..3] = {90, 93, 96, 99}`.
Os quatro Verilog re-sintetizados nessa execução tiveram os mesmos SHA-256
dos quatro arquivos arquivados aqui. Assim, a RTL deste smoke passou
co-simulação funcional. Isso não valida a execução do kernel via runtime
PoCL, o `conv_pipe.cl`, fluxo de power ou síntese ASIC.

Os checksums de `SHA256SUMS` foram comparados com os arquivos na Paxos antes
do arquivamento.
