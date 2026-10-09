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

Na primeira elaboração, duas instâncias `st_write` ficaram sem binding
([`elab-1fs.log`](artifacts/questa/elab-1fs.log)). A implementação fornecida
com o Quartus 18.1 foi localizada em
`/soft64/altera/ferramentas/quartus/18.1/hld/ip/st_top.v` e compilada no
ambiente Questa; seu SHA-256 foi
`6819e73f6ac201a44c7fd4879b2e9ffa4b4f8c438aaf7e0d4514b9cac3228dba`. O fonte
licenciado não foi copiado para este repositório. Após recompilar o wrapper
otimizado, o Questa carregou `work.st_write` e elaborou
`memRead_function_wrapper` com 0 erros e 26 avisos de coerção `tri1`/`tri0`.
O resultado está em [`elab-st-top-vopt.log`](artifacts/questa/elab-st-top-vopt.log).

Foi adicionado o testbench
[`tb_st_write_adapter.vhd`](testbench/tb_st_write_adapter.vhd), que instancia
o adaptador de canal gerado `i_iowr_bl_bypass_ch_unnamed_memread8_memread2596`
com o `st_write` oficial do Quartus. Com assertions, ele verifica o
empacotamento dos seis valores `int16` em 96 bits, a estabilidade do dado e o
backpressure enquanto `ready=0`, o `ack` após `ready=1` e que não há escrita
duplicada. A simulação passou no Questa 2023.4 com 0 erros e 0 avisos; logs de
compilação, otimização e execução estão em
[`artifacts/questa/vlog-st-top.log`](artifacts/questa/vlog-st-top.log),
[`artifacts/questa/vcom-st-write-tb.log`](artifacts/questa/vcom-st-write-tb.log),
[`artifacts/questa/vopt-st-write-tb.log`](artifacts/questa/vopt-st-write-tb.log)
e [`artifacts/questa/sim-st-write-tb.log`](artifacts/questa/sim-st-write-tb.log).
O binding foi refeito com um novo nome de snapshot (`memRead_function_wrapper_stwritebound`);
isso evita reutilizar o snapshot otimizado anterior, que fora gerado antes de
`st_write` ser compilado. Os comandos executados, partindo da biblioteca
Questa já preparada e dos VHDLs do kernel já compilados, foram:

```bash
module load questa/2023b
vlog -modelsimini "$MODELSIMINI" -sv -work work \
  "$QUARTUS_ROOT/hld/ip/st_top.v"
vopt -modelsimini "$MODELSIMINI" -L work -L altera_mf_ver -L lpm_ver \
  -L altera_lnsim_ver -L sgate_ver -L stratixv_ver -L altera_ver \
  -L altera_mf -L altera_lnsim -L lpm -work work \
  memRead_function_wrapper -o memRead_function_wrapper_stwritebound
vsim -modelsimini "$MODELSIMINI" -t 1fs -L work -L altera_mf_ver \
  -L lpm_ver -L altera_lnsim_ver -L sgate_ver -L stratixv_ver \
  -L altera_ver -L altera_mf -L altera_lnsim -L lpm -c \
  work.memRead_function_wrapper_stwritebound \
  -do "run 0 ns; quit -f"
vcom -modelsimini "$MODELSIMINI" -93 -work work \
  testbench/tb_st_write_adapter.vhd
vopt -modelsimini "$MODELSIMINI" -L work -L altera_mf_ver -L lpm_ver \
  -L altera_lnsim_ver -L sgate_ver -L stratixv_ver -L altera_ver \
  -L altera_mf -L altera_lnsim -L lpm -work work \
  tb_st_write_adapter -o tb_st_write_adapter_opt
vsim -modelsimini "$MODELSIMINI" -t 1fs -L work -L altera_mf_ver \
  -L lpm_ver -L altera_lnsim_ver -L sgate_ver -L stratixv_ver \
  -L altera_ver -L altera_mf -L altera_lnsim -L lpm -c \
  work.tb_st_write_adapter_opt -do "run 80 ns; quit -f"
```

`MODELSIMINI` deve apontar ao `modelsim.ini` das bibliotecas já compiladas;
`QUARTUS_ROOT` deve ser a instalação Quartus 18.1 usada nesta campanha.

Isso valida o binding e o handshake do adaptador de canal, mas ainda não
simula uma transação de convolução através de `memRead_function_wrapper` e do
restante do pipeline. O VHDL continua sendo saída intermediária do AOCL
Standard: não foi produzido `.aocr`, e não houve síntese ASIC nem execução em
FPGA.

O scratch completo permanece em
`/sim/tarsio/aocl-int16-4mul-lane1-20261008-4VZhoo/`. Este diretório local
preserva os fontes, o `.aoco`, o relatório, os logs usados para interpretar os
resultados e os arquivos VHDL gerados para os kernels. Nenhuma implementação
física ou execução FPGA ocorreu; o link RTL AOCL também não foi concluído.
