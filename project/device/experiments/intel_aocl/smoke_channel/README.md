# Smoke test AOCL com canal Intel

Este é o menor controle desta pasta que exercita a extensão usada pelos
kernels do projeto: um canal global conecta dois kernels OpenCL. Ele serve para
confirmar o ambiente AOCL, a seleção de um BSP Standard compatível e o frontend
de `cl_intel_channels`.

## Execução registrada

Em 2026-10-08, AOCL 18.1.0 Build 625 Standard executou no BSP `s5_ref` dentro
de um scratch remoto isolado, com timeout de 180 s. O comando foi
`aoc -v -c -board=s5_ref aocl_channel_smoke.cl`; o log preservado em
[`aoc.log`](aoc.log) termina com status 0.

O ambiente verificou-se, o parser OpenCL completou, a análise estática foi
concluída e o AOCL informou sucesso da primeira etapa. Foi gerado
[`aocl_channel_smoke.aoco`](artifacts/aocl_channel_smoke.aoco) (140.172 bytes), no scratch
`/sim/tarsio/aocl-channel-smoke-20261008-HSiyqm/`. O log indica como próximo
passo `aoc aocl_channel_smoke.aoco`. Não houve `.aocr` nem RTL completo do
kernel; `-c` valida somente a etapa intermediária. A biblioteca
`rtl_lib.aoclib` não foi necessária para este controle.

O relatório curto está em [`artifacts/report.html`](artifacts/report.html).
Os arquivos maiores do BSP foram mantidos no scratch remoto e não foram
copiados para esta pasta.

## Tentativa de `-rtl`

O objeto `.aoco` foi usado em `aoc -v -rtl -save-temps -board=s5_ref
aocl_channel_smoke.aoco`, com timeout de 180 s. A tentativa terminou com
código 124; o log externo preservado em [`aoc-rtl.log`](aoc-rtl.log) só
registra “Compiling for FPGA”. O consumo máximo foi 1.607.204 KiB de RSS e o
uso médio de CPU, 169%.

A inspeção posterior dos logs internos mostrou que o AOCL gerou VHDL dos dois
kernels em [`artifacts/generated-kernel-hdl/`](artifacts/generated-kernel-hdl/)
(23 arquivos, cerca de 368 KiB) e avançou para `quartus_map`, a etapa Analysis
& Synthesis da integração da placa `s5_ref`. A ajuda do AOCL instalado não
lista a opção `-rtl` e descreve somente saídas `.aoco` e `.aocx`; por isso, a
interpretação mais provável é que esta instalação Standard não ofereça o
modo documentado `-rtl`, e que o comando tenha seguido o fluxo normal de
compilação de hardware. O log de Quartus está em
[`artifacts/quartus_sh_compile.log`](artifacts/quartus_sh_compile.log) e
registra avisos de que não conseguiu contatar o servidor de licença
`27010@paxos.inf.pucrs.br`.

Não houve `.aocr`; `aocl_channel_smoke.v` permaneceu vazio. Há VHDL
intermediário gerado para os kernels, mas o fluxo AOCL não terminou e esse
conjunto não é uma saída standalone validada. `base.aocx` e outros arquivos
do BSP não são resultados compilados do kernel smoke.

O BSP `s5_ref` é usado apenas para diagnóstico de AOCL Standard. Ele não é o
alvo Arria 10 do projeto e não fundamenta comparação de PPA.

## Repetição do fluxo Standard com `-c`

Em 2026-10-08, repetimos o smoke em uma pasta temporária na Paxos usando
`aoc -c -report -v -board=s5_ref aocl_channel_smoke.cl` (sem `-rtl`). O AOCL
18.1.0 Standard terminou com status 0 em 3,33 s. Gerou o objeto
`aocl_channel_smoke.aoco` (140.240 bytes), `aocl_channel_smoke_system.v`
(94.555 bytes), os arquivos `top.qsf` e `base.qsf`, e um `top.v` de 9.814
bytes. `aocl_channel_smoke.v` foi criado vazio. O relatório de recursos foi
impresso no log.

Isso confirma que `-c` completa para o kernel mínimo e deixa o objeto AOCL e
arquivos do projeto Quartus. Não gera `.aocr` nem comprova que o conjunto de
arquivos seja RTL completo e independente para ASIC. O scratch usado foi
`/sim/tarsio/aocl-standard-channel-smoke.BdsX9t/`.

## Kernel completo `conv_pipe.cl`

Também foi tentado, no mesmo dia e em outro scratch remoto, o fluxo Standard
com a biblioteca RTL do projeto:

```bash
aoc -c -report -v -board=s5_ref \
    -I device/RTL \
    -L device/RTL \
    -l rtl_lib.aoclib \
    device/conv_pipe.cl
```

O parser terminou, mas a otimização estática (`aocl-opt`) não concluiu dentro
do limite de 180 s; o comando foi encerrado pelo timeout, status 124. O processo
de otimização chegou a aproximadamente 1,1 GiB de RSS e manteve uso de CPU
próximo de 100%. Foram criados `conv_pipe.aoco.tmp` e arquivos do projeto
Quartus, mas não houve `.aoco` final nem `.aocr`. O scratch está em
`/sim/tarsio/aocl-standard-c-smoke.GDxq8r/`. Assim, o smoke mínimo passou, mas a
etapa `-c` do kernel completo ainda não foi concluída.
