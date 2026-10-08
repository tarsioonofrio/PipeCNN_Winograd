# VCD com captura completa do vetor de pesos

Run remoto: `/sim/tarsio/PipeCNN_Winograd/project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032/runs/memread-f43-i8-l032-20261007T-run05-vcd-probe-fixed`

O run05 reutilizou somente os resultados lógicos imutáveis do run02 por symlink. Não repetiu Genus.
O fluxo de captura usado está em `project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032/sim/run_vcd_probe.sh` e `sim/vcd_probe.tcl`; ambos foram enviados ao checkout da Paxos com hashes comparados.

## Artefatos copiados e conferidos por SHA-256

| Arquivo local | SHA-256 |
|---|---|
| `sim/dut.vcd` | `f2937d09025ae19186f2c1116cac91a2715560d3b60b8f7d91012523a5328c08` |
| `sim/xrun.log` | `3e56077c94cc09579094fa811508bd52229c1f6ada58685b2908e369d94b0dc4` |
| `sim/sdf.log` | `88ca60c838e4b25fa59a6fca5c6dae5825978868d593bb1fd79e7b2344406176` |

## Validação da captura

- Xcelium encerrou com `PASS` aos 150 ns.
- O VCD declara os 24.576 bits de `tb_memread_conv_slice.dut.transformed_weights`, índices 0–24575.
- Uma leitura integral dos valores VCD encontrou mudanças nos 24.576 bits: 73.446 transições escalares no total.
- Essa verificação pode ser repetida com `python3 reports/paxos-run05-vcd-probe-fixed-20261007/verify_vcd_weights.py`.
- Não houve avisos `LMTMSG` ou `PRPASZ` no run05. Há aviso `DFUSE` porque `$dumpfile` no testbench tentou abrir o VCD que o Tcl já havia aberto; apesar disso, as declarações e transições do vetor foram confirmadas no arquivo final.
- A anotação SDF cobriu 100% dos 8.525.367 path delays, 99,74% dos `$setuphold` e 0% dos 350.136 `$width`; no total, 174.844 de 525.428 timing checks (33,28%).

O VCD agora contém o vetor de pesos e atividade no DUT, corrigindo a omissão do run02/run03. O executável Joules standalone não está disponível: a consulta de licenças na Paxos não anunciou `Joules_RTL_Power` nem `Joules_Power_SP`.

## Estimativa de potência Genus com VCD

Depois da simulação, Genus 21.12 leu o banco lógico imutável do run02 e este
VCD usando o escopo `tb_memread_conv_slice/dut`. O fluxo está em
`project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032/power/`.
O log confirma que o parser Joules integrado ao Genus leu o VCD, propagou a
atividade e concluiu `report_power` com `PWRA-0007`; esta execução não usou o
executável Joules standalone. O servidor continua sem anunciar
`Joules_RTL_Power` ou `Joules_Power_SP`.

| Artefato local | SHA-256 |
|---|---|
| `power_genus/power_evaluation.txt` | `baa41b06ca085fb3290369b8136bef82f1aecc072e333f3cd8b7772027c58fa3` |
| `power_genus/genus.log` | `511bfe547e303be1d39b7a348974d6c4b78028886e6ccd1bf6b4350068bf1f81` |
| `power_genus/genus_console.log` | `521d30ef4dd4b8bc15af25b365bc5a8ac6746f021cfedb1f62341c2f9f1fcdb4` |
| `power_genus/genus.cmd` | `793e65a988d51f064f959f898efe04b3edebdfc68416122f9b8fc8d844f82767` |

O relatório calcula potência média de `147.830 mW`: `5.69165 mW` leakage,
`57.0665 mW` internal e `85.0722 mW` switching. O VCD cobre 0–150 ns; o
produto da média reportada por essa janela é `22.1745 nJ` (derivado, não uma
medição separada de energia por operação). A anotação listou 100% das entradas,
saídas e saídas de flip-flop, com 478 de 1.284.005 driver nets desconectados.
O relatório mostra 0 mW na categoria clock, sem árvore CTS física.

Esse número é uma estimativa Genus/Joules para a fatia aritmética reconstruída
e três vetores curtos do testbench, incluindo reset/ociosidade da janela. Não
representa uma camada YOLOv2, a arquitetura AOCL completa, potência pós-route
ou medição física. Persistem os avisos de biblioteca/PHYS no log; o VCD também
tem cobertura SDF de 33,28% dos timing checks (0% dos checks `$width`).
