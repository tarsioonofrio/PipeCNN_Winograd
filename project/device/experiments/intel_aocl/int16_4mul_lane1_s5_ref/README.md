# AOCL `-c` e `-rtl`: variante 4mul com uma lane

Este piloto usa uma cópia isolada da variante
[`../int16_4mul_per_channel/`](../int16_4mul_per_channel/), AOCL 18.1.0 Build
625 Standard e BSP `s5_ref`. `s5_ref` foi escolhido para diagnosticar o fluxo
Standard; não é o alvo Arria 10 do projeto e os resultados não são PPA
comparável.

## Fontes usados

Os três fontes nesta pasta são o snapshot exato enviado ao AOCL. Somente a
cópia scratch recebeu estas mudanças:

- `LANE_NUM` de 32 para 1; `VEC_SIZE=16` e `W_VEC_SIZE=6` foram preservados.
- Inicializador de `intvec data_vec_zero4` de `{0}` para `{{0}}`, depois que o
  parser rejeitou o inicializador original porque `intvec` contém um array.
- `win_buffer` de `bankwidth(64)` para `bankwidth(128)`, depois que o parser
  informou que o tipo tem largura de 128 bits. Essa mudança altera a
  configuração da memória e precisa ser tratada como parte da variante de
  teste, não como um detalhe neutro. A substituição textual também alterou
  uma ocorrência comentada de `bankwidth(64)` no snapshot; ela não participa
  da compilação.

Os fontes originais em `../int16_4mul_per_channel/` não foram alterados.

## Resultado

O comando de primeira etapa foi:

```bash
aoc -v -c -board=s5_ref -I . conv_pipe_int16_4mul.cl
```

Após as duas correções somente no scratch, o parser e a primeira etapa AOCL
terminaram com status 0 em 32,65 s. Foi gerado
[`conv_pipe_int16_4mul.aoco`](conv_pipe_int16_4mul.aoco) (280.084 bytes), com
RSS máximo de 347.716 KiB. Os logs das duas rejeições anteriores e da execução
bem-sucedida estão preservados nesta pasta.

A etapa de geração foi tentada separadamente:

```bash
aoc -v -rtl -save-temps -board=s5_ref conv_pipe_int16_4mul.aoco
```

Ela foi encerrada pelo timeout de 180 s, código 124, após 3:00, com RSS máximo
de 1.588.896 KiB e uso médio de 167% de CPU. O log externo mostra apenas
“Compiling for FPGA”; a leitura posterior do log interno identificou a etapa
`quartus_map` (Analysis & Synthesis da placa `s5_ref`). Antes do timeout, o
AOCL gerou 1.209 arquivos VHDL de kernel em
[`artifacts/generated-kernel-hdl/`](artifacts/generated-kernel-hdl/), nas
subárvores `memRead` e `memWrite`. O log de Quartus está preservado em
[`artifacts/quartus_sh_compile.log`](artifacts/quartus_sh_compile.log).

A ajuda desta instalação AOCL 18.1 Standard não lista `-rtl` e descreve como
saídas `.aoco` e `.aocx`. Isso sugere que essa edição não oferece o modo
documentado `-rtl`; a invocação seguiu o fluxo de compilação de hardware.

Não foi produzido `.aocr`; `conv_pipe_int16_4mul.v` tem 0 bytes. O VHDL
gerado é intermediário do compilador, não é uma saída standalone validada.
Os arquivos do sistema BSP não são tratados como RTL do kernel. O processo
AOCL terminou e não restou `aoc` ativo.

O scratch completo permanece em
`/sim/tarsio/aocl-int16-4mul-lane1-20261008-4VZhoo/`. Este diretório local
preserva os fontes, o `.aoco`, o relatório, os logs usados para interpretar os
resultados e os arquivos VHDL gerados para os kernels. Nenhuma implementação
física ou execução FPGA ocorreu; o link RTL AOCL também não foi concluído.
