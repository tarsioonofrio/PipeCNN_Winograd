# PoCL-HLS / AlmaIF HLS

## Decisão

Esta é a ferramenta escolhida para a próxima investigação de HLS OpenCL. A
escolha ainda não representa uma conversão concluída nem uma validação do
`conv_pipe.cl`.

O objetivo local é obter RTL do kernel e parar aí. A integração AlmaIF,
`v++`, `.xclbin`, emulação de placa e programação FPGA não fazem parte do
experimento.

O fluxo completo descrito pelo projeto é:

```text
OpenCL C → Polygeist/ClangIR → MLIR/PoCL → Hida/ScaleHLS
          → C++ para Vitis HLS → RTL → Vivado/AlmaIF → .xclbin
```

O caminho útil termina após `Vitis HLS` sintetizar o C++ emitido pelo
ScaleHLS/Hida. Inspecionei o fonte: `AlmaifCompileMLIR.cc` emite
`parallel_hls.cpp`, chama `generate_hls_core.tcl` e depois segue para criar
`.xo`, `.xclbin` e firmware. O Tcl faz `csynth_design` e `export_design` em
Verilog antes dessas etapas de empacotamento. Assim, basta preservar a saída
do HLS e parar antes de `pocl_almaif_mlir_generate_xo_from_rtl()`; nenhuma
placa ou bitstream é necessária. O Tcl original fixa o part U280 e um clock de
4 ns, parâmetros de síntese que precisam ser registrados no resultado.

O RTL gerado é uma saída HLS para a configuração escolhida. Ainda não foi
verificado se ele é independente de IPs/scripts AMD nem se pode ser sintetizado
diretamente por Genus ou outro fluxo ASIC.

## Compatibilidade com o PipeCNN

O kernel original tem dois entry points, `memRead` e `memWrite`, e usa canais
Intel globais declarados em `type_def.cl`, `read_channel_intel`/
`write_channel_intel`, além de atributos de memória como `numbanks` e
`bankwidth`. A documentação do PoCL-HLS descreve OpenCL C padrão e um fluxo de
kernels/workgroups; ela não documenta suporte à extensão
`cl_intel_channels` ou a esses atributos Intel.

Portanto, a compatibilidade direta do `conv_pipe.cl` é desconhecida e há um
risco concreto de incompatibilidade. Não se deve remover os canais ou
reescrever a comunicação entre kernels sem medir o efeito arquitetural e sem
registrar que isso passa a ser uma variante diferente do PipeCNN.

## Estado observado na Paxos em 2026-10-08

O toolchain foi construído em `/sim/tarsio/pocl_hls_rtl`:

- PoCL-HLS: revisão `e72cb721b6c02b208fee500f43fcfd77f32b83f0`.
- Hida/ScaleHLS: fork `cpc/ScaleHLS-HIDA`, revisão
  `3929a7f80ecd18a21a6137e7355e8bb06652a8b6`.
- ClangIR LLVM: revisão `d4ebb05f347d8d9d62968676d5b2bbc1338de499`;
  LLVM/ClangIR, `cir-opt`, `scalehls-opt` e `scalehls-translate` foram
  compilados.
- PoCL runtime e plugin AlmaIF foram compilados. O smoke inicia o device
  AlmaIF emulado, compila o OpenCL, emite MLIR e C++ HLS e chama o Vitis HLS.
- O Vitis HLS dedicado foi encontrado em
  `/soft64/xilinx/ferramentas/Vitis_HLS/2024.2/bin/vitis_hls`; o ambiente é
  carregado por `source /soft64/xilinx/ferramentas/Vitis_HLS/2024.2/settings64.sh`.
  `vitis-run --mode hls` falhou porque as plataformas Vitis não estão
  instaladas. O CLI dedicado aceitou `xc7z020clg400-1` no fluxo HLS `vivado`.

O teste integrado registrou `RTL-only mode: generated Verilog` em
`pocl-hls-integrated2.log`. O Verilog está em:

```text
/sim/tarsio/pocl_hls_rtl/pocl-cache-integrated2/KG/CPAADGNKGBHBBODMBJKJGLDBLJOFAJNGAMGDI/command_buffer/1-1-1-goffs0-smallgrid/vitis_project_command_buffer/solution1/syn/verilog/
```

Foram produzidos `pocl_mlir_command_buffer.v`,
`pocl_mlir_command_buffer_axi_0_m_axi.v`,
`pocl_mlir_command_buffer_control_s_axi.v` e
`pocl_mlir_command_buffer_flow_control_loop_delay_pipe.v`. O kernel smoke
escreve quatro inteiros. A síntese confirmou uma porta AXI e um loop; não
executamos o kernel nem comparamos os valores em runtime.

Os quatro Verilog e o log original foram copiados para o repositório em
[`smoke/generated-rtl/`](smoke/generated-rtl/README.md). O arquivo
`SHA256SUMS` registra hashes conferidos contra a saída que permanece na Paxos.

Esse resultado valida a geração RTL do smoke, mas o processo PoCL não termina
limpo em todas as execuções: os passes Affine do clone apresentaram falhas de
memória. Na execução que gerou os arquivos acima, o HLS terminou e o PoCL
depois tentou compilar/carregar o programa para o emulador, etapa fora do
objetivo RTL-only, e abortou. O patch experimental agora retorna antes desse
carregamento, mas a repetição seguinte caiu antes de chegar ao HLS por uma
falha de memória nos passes. Esse retorno antecipado ainda não foi validado
num smoke completo; o fluxo precisa estabilizar antes de uma campanha
reproduzível.

Não foi feita tentativa de compilar `conv_pipe.cl`. O kernel usa
`cl_intel_channels`, `read_channel_intel`/`write_channel_intel` e atributos
`numbanks`/`bankwidth`; suporte direto continua sem verificação. Não remova
esses elementos para contornar o frontend sem registrar isso como outra
variante arquitetural.

## Próxima etapa

Reproduzir o smoke do zero com o patch em
[`patches/rtl-only-vitis-2024.2.patch`](patches/rtl-only-vitis-2024.2.patch),
entender e remover a corrupção de memória nos passes PoCL/MLIR e obter uma
execução integrada com status zero. Depois, inspecionar os artefatos da RTL e
testar a compilação do `conv_pipe.cl` separadamente, sem apagar os caches e
logs atuais.

## Fontes

- [Repositório PoCL-HLS e fluxo AlmaIF](https://github.com/cpc/pocl-hls)
- [Vitis HLS 2024.2: síntese C e geração de RTL](https://docs.amd.com/r/2024.2-English/ug1399-vitis-hls/Running-C-Synthesis)
- [Fonte inspecionado na Paxos: `AlmaifCompileMLIR.cc` e `generate_hls_core.tcl`](https://github.com/cpc/pocl-hls/tree/e72cb721b6c02b208fee500f43fcfd77f32b83f0/lib/CL/devices/almaif/mlir)
- [Fork cpc do Hida atualizado para ClangIR](https://github.com/cpc/ScaleHLS-HIDA/commit/3929a7f80ecd18a21a6137e7355e8bb06652a8b6)
- [README local sobre o inventário de conversores](../opencl-to-verilog-tools.md)
