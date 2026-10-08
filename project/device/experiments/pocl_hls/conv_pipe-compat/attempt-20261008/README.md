# Probe de compatibilidade do `conv_pipe.cl` com PoCL-HLS

## Resultado

O frontend PoCL-HLS não compilou o kernel original. O ClangIR parou no build
OpenCL, antes da geração de MLIR para HLS. As mensagens de erro mostram que
`channel` é tipo desconhecido e que `read_channel_intel` e
`write_channel_intel` não estão declaradas. Os atributos `numbanks` e
`bankwidth` são reportados como desconhecidos e ignorados.

Como resultado, esta tentativa não produziu `parallel_hls.mlir`, C++ HLS ou
RTL de `conv_pipe.cl`, e não chamou Vitis HLS. Ela confirma incompatibilidade
do frontend e configuração usados nesta tentativa; não é uma afirmação sobre
todas as versões ou variantes possíveis de PoCL-HLS.

## Configuração usada

- Fonte original: `project/device/conv_pipe.cl`, sem alterações.
- Includes: `project/device/`, `project/device/RTL/`.
- Kernel selecionado pelo harness: `memWrite`.
- PoCL-HLS no scratch da Paxos: revisão `e72cb721b6c02b208fee500f43fcfd77f32b83f0`.
- Hida/ScaleHLS: revisão `3929a7f80ecd18a21a6137e7355e8bb06652a8b6`.
- Opções do build: `-cl-kernel-arg-info` e os dois include paths acima.
- Ambiente PoCL: `POCL_BUILDING=1`, `POCL_DEVICES=almaif`, cache isolado.
- `POCL_ALMAIF_MLIR_RTL_ONLY=1` e uma parada temporária
  `POCL_ALMAIF_MLIR_HLS_CPP_ONLY=1` foram usadas para garantir que, se o
  frontend passasse, a geração pararia antes do Vitis. O diff está em
  [`hls-cpp-only.patch`](hls-cpp-only.patch); a alteração foi removida do clone
  PoCL-HLS após a tentativa, preservando seu diff preexistente.

O build falhou durante `clBuildProgram` com `CL_BUILD_PROGRAM_FAILURE`
(`-11`). A tentativa foi no frontend, então não exercitou ScaleHLS, Vitis,
simulação, síntese FPGA ou fluxo ASIC.

## Fontes e integridade

O SHA-256 de `conv_pipe.cl` no momento do probe foi
`dc726f60e79a4f568bb11605836c13d0c6b4eea299894390d981b28e60f6edc3`.
Os hashes dos demais includes (`hw_param.cl`, `type_def.cl` e `RTL/rtl_lib.h`)
e dos artefatos desta tentativa estão em [`SHA256SUMS`](SHA256SUMS).

- [`pocl-build.log`](pocl-build.log): saída completa do frontend.
- [`run_conv_probe.c`](run_conv_probe.c): harness usado para construir o
  programa e selecionar `memWrite`; não enfileira execução do kernel.
- [`hls-cpp-only.patch`](hls-cpp-only.patch): parada temporária antes do Vitis.

O scratch remoto com cache e arquivos de diagnóstico foi mantido em
`/sim/tarsio/pocl_hls_rtl/conv_pipe-hlscpp-probe/`.
