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

## Validação do VHDL com Questa

Em 2026-10-08, os 1.209 arquivos VHDL gerados para `memRead` e `memWrite`
foram compilados no QuestaSim 64 2023.4. O log completo da compilação está em
[`artifacts/questa/vcom.log`](artifacts/questa/vcom.log); terminou com 0 erros
e 0 avisos. O setup usado está registrado em
[`artifacts/questa/setup.log`](artifacts/questa/setup.log).

Também foi carregado no simulador o bloco aritmético selecionado dentro do
kernel `memRead`, aplicando estímulos diretamente aos sinais internos:

- Caso dirigido com produtos assinados `(-3×5) + (-7×-2) + (10×4) + (1×-8)`:
  os dois resultados parciais observados foram `0x1FFFFFFFF` e `0x000000020`,
  e o resultado truncado para 32 bits foi `0x0000001F` (31).
- Caso de overflow com quatro produtos `(-32768)×(-32768)`: o resultado final
  observado nos 32 bits baixos foi `0x00000000`, conforme wraparound módulo
  `2^32`.

Os registros desses casos são
[`cma-smoke-pass.log`](artifacts/questa/cma-smoke-pass.log) e
[`cma-overflow-pass.log`](artifacts/questa/cma-overflow-pass.log). Os nomes
“pass” indicam que os valores observados coincidem com os esperados; os
comandos usam `force`/`examine` e **não têm assertions automáticas**. Portanto,
isto valida casos aritméticos dirigidos do bloco gerado, não a execução
funcional de uma convolução completa.

A tentativa de elaborar `memRead_function_wrapper` terminou sem erros fatais,
mas deixou duas instâncias `st_write` sem binding e avisos de portas `tri1`/
`tri0`. O log está em [`elab-1fs.log`](artifacts/questa/elab-1fs.log). Sem
implementar/bindar os canais e executar uma transação de ponta a ponta, o
wrapper não comprova o comportamento do kernel completo. O VHDL continua sendo
saída intermediária do AOCL Standard: não foi produzido `.aocr`, e não houve
síntese ASIC nem execução em FPGA.

O scratch completo permanece em
`/sim/tarsio/aocl-int16-4mul-lane1-20261008-4VZhoo/`. Este diretório local
preserva os fontes, o `.aoco`, o relatório, os logs usados para interpretar os
resultados e os arquivos VHDL gerados para os kernels. Nenhuma implementação
física ou execução FPGA ocorreu; o link RTL AOCL também não foi concluído.
