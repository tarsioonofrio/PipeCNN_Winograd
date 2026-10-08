# Experimentos de conversão e variantes

Os experimentos ficam agrupados pelo tipo de artefato e, quando há conversão,
pela ferramenta usada.

O inventário de ferramentas candidatas, seus formatos de entrada, estado de
disponibilidade e limites para este kernel está em
[`opencl-to-verilog-tools.md`](opencl-to-verilog-tools.md).

## Conversões HLS por ferramenta

- `bambu/mac4_i16_i8/`: saída do Bambu para o MAC isolado de quatro produtos,
  com fontes, RTL, logs e runner de simulação. Não representa conversão do
  kernel OpenCL completo.
- `pocl_hls/`: ferramenta escolhida para investigação seguinte; disponibilidade
  e compatibilidade do toolchain com canais Intel ainda não foram validadas.

Uma conversão futura com outra ferramenta deve ganhar uma pasta própria neste
nível, por exemplo `experiments/<ferramenta>/<alvo>/`.

## Variantes e experimentos Intel AOCL

- `intel_aocl/int16_2mul_per_channel/`
- `intel_aocl/int16_4mul_per_channel/`
- `intel_aocl/smoke_channel/` e `intel_aocl/int16_4mul_lane1_s5_ref/` registram
  o smoke AOCL e o primeiro piloto reduzido.

As duas variantes por canal seguem sem compilação. O smoke e o piloto 4mul
passaram a primeira etapa AOCL e preservam VHDL intermediário dos kernels, mas
ambos os `-rtl` pararam em `quartus_map` antes de criar `.aocr`. Consulte
[`intel_aocl/README.md`](intel_aocl/README.md) para os limites atuais.

As reconstruções RTL manuais ficam reunidas em
[`../reconstructions/`](../reconstructions/README.md). Verilator aparece nos
runners como simulador e não como ferramenta de conversão.
