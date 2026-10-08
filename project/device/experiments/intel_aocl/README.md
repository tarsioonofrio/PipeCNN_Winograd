# Variantes OpenCL para Intel AOCL

Esta pasta reúne variantes do kernel preparadas para explorar o compilador
Intel AOCL:

- `int16_2mul_per_channel/`: redução em pares de produtos int16.
- `int16_4mul_per_channel/`: quatro produtos int16 por iteração de redução.
- `smoke_channel/`: smoke AOCL de dois kernels ligados por `cl_intel_channels`,
  com VHDL intermediário preservado.
- `int16_4mul_lane1_s5_ref/`: piloto da variante 4mul com `LANE_NUM=1` no
  BSP diagnóstico `s5_ref`, incluindo `.aoco`, logs e timeout da etapa `-rtl`.

As duas variantes são fontes experimentais derivadas de
`project/device/conv_pipe.cl`. Os fontes originais ainda não foram compilados
como estão; o piloto 4mul usa uma cópia com `LANE_NUM=1` e ajustes de parser/
largura de banco registrados na pasta do experimento. Os READMEs das variantes
registram tipos, hipóteses aritméticas e adaptações pendentes no host e nos
pesos.

AOCL é o fluxo prioritário para testar estas fontes porque é o compilador
original do projeto. O smoke e o piloto de uma lane demonstraram que AOCL 18.1
Standard e o BSP `s5_ref` compilam a primeira etapa. As duas tentativas de
geração foram interrompidas em 180 s durante `quartus_map`; antes disso, AOCL
deixou VHDL intermediário dos kernels, preservado nas pastas dos experimentos.
A ajuda da instalação Standard não lista `-rtl`, então a hipótese mais
provável é que ela não suporte o modo que gera `.aocr` e tenha seguido o fluxo
normal de hardware. `s5_ref` é apenas diagnóstico; o alvo Arria 10 continua
dependendo de um ambiente Quartus Prime Pro compatível.
