# Diagnósticos preservados do run Genus

- Run: `system-f43-i8-l032-20261007T182100`
- Host: `paxos.inf.pucrs.br`
- Captura local: 2026-10-07, 21:20 BRT
- Estado na captura: processos Genus ativos; a pasta remota do run continha
  somente `genus.log`, sem relatórios ou netlist.

| Arquivo local | Origem remota | Tamanho | SHA-256 |
|---|---|---:|---|
| `genus.log` | `/sim/tarsio/PipeCNN_Winograd/project/device/RTL/synthesis/opencl-system-f43-i8-l032/runs/system-f43-i8-l032-20261007T182100/logical/genus.log` | 20.220 B | `780cfe468611f05c403087cf94d5dcbaee49c8ad06b9dabda80a9fc4fdaa4c09` |
| `MESG-20261007T211719.txt` | `/tmp/genus_temp_3507722_paxos.inf.pucrs.br_tarsio.onofrio_1AfSjp/genus_temp_3510874_paxos.inf.pucrs.br_tarsio.onofrio_muVDJL/MESG.1695000194_1791409434_3510874.oNsTim` | 90.451 B | `838063459e50fff04a8edd45549113b4c833a5ad774e464dd2ae74fd50549d8a` |

As duas somas foram comparadas entre o notebook e a Paxos. `MESG` é um arquivo
temporário interno do Genus, não um relatório final de síntese. O processo ainda
estava ativo durante a cópia; essa captura é um snapshot e pode não conter
mensagens posteriores.

## Captura final após interrupção solicitada — 2026-10-07, 22:29–22:30 BRT

O usuário solicitou parar o run. Após confirmar que o PGID 3507685 continha
somente o launcher `bash ./run.sh`, `logical/run.sh`, o Genus PID 3507722 e seus
descendentes, foi enviado `SIGTERM` ao grupo. Cinco segundos depois o grupo
estava vazio; uma segunda consulta confirmou ausentes os PIDs 3507685, 3507689,
3507722, 3510872, 3510874 e 3514857. Os logs foram copiados depois da saída do
processo, e seus hashes locais conferem com a Paxos.

| Arquivo local | Origem remota | Tamanho | SHA-256 |
|---|---|---:|---|
| `genus-workdir-after-stop-20261007T2230.log` | `/sim/tarsio/PipeCNN_Winograd/project/device/RTL/synthesis/opencl-system-f43-i8-l032/logical/genus.log` | 65.402 B | `f4bdf14db259d80b6e3c248d39d3b1be7cf37294cbd0d45bdbc79baeb86a69cc` |
| `genus-runstream-after-stop-20261007T2230.log` | `/sim/tarsio/PipeCNN_Winograd/project/device/RTL/synthesis/opencl-system-f43-i8-l032/runs/system-f43-i8-l032-20261007T182100/logical/genus.log` | 20.220 B | `780cfe468611f05c403087cf94d5dcbaee49c8ad06b9dabda80a9fc4fdaa4c09` |

O log do run e a árvore `runs/system-f43-i8-l032-20261007T182100` não contêm
netlist ou relatório final. O log interno do diretório de trabalho termina
durante truques de otimização pós-elaboração; não contém `Normal exit`. Os
arquivos temporários `.pbs` foram preservados no remoto e não foram limpos.
