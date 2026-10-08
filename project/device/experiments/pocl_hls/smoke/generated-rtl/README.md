# RTL gerado pelo smoke test PoCL-HLS

Este diretório arquiva a saída produzida na Paxos em 2026-10-08 pelo smoke
test descrito em `../README.md`. Os quatro arquivos Verilog e o log original
foram copiados do cache da execução; `SHA256SUMS` registra os hashes dos
Verilog.

## Origem

- Cache original:
  `/sim/tarsio/pocl_hls_rtl/pocl-cache-integrated2/KG/CPAADGNKGBHBBODMBJKJGLDBLJOFAJNGAMGDI/command_buffer/1-1-1-goffs0-smallgrid/vitis_project_command_buffer/solution1/syn/verilog/`
- Toolchain: PoCL-HLS `e72cb721b6c02b208fee500f43fcfd77f32b83f0`, Hida/ScaleHLS
  `3929a7f80ecd18a21a6137e7355e8bb06652a8b6`, Vitis HLS 2024.2.
- Parâmetros do Vitis HLS: fluxo `vivado`, part `xc7z020clg400-1`.
- Kernel: o smoke OpenCL de quatro elementos; não é o `conv_pipe.cl`.

## Limites do resultado

O log registra `csynth_design` e a mensagem `RTL-only mode: generated Verilog`.
Depois dessa etapa, o processo PoCL continuou para carregar o programa no
emulador e abortou durante codegen LLVM X86 com `free(): invalid next size`.
Portanto, estes arquivos comprovam a geração de RTL pelo Vitis HLS, mas não
comprovam execução funcional do kernel. Os valores calculados não foram
verificados por execução, e estes arquivos não passaram por simulação
funcional, fluxo de power ou síntese ASIC.

Os checksums de `SHA256SUMS` foram comparados com os arquivos na Paxos antes
do arquivamento.
