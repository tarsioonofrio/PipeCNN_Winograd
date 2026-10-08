# Verificação local — 2026-10-07

## Ambiente e escopo

- Checkout base: `master` em `5f767b4882d039d47e0a7aeaeceb2495266b9168`.
- As implementações e testbenches desta campanha estão no worktree como
  arquivos não rastreados; o SHA acima identifica somente o checkout base.
- Verilator: `5.050 2026-07-01`.
- Resultado: os 14 runners Verilator listados abaixo terminaram com `PASS`; os
  dois testes Python de derivação dos parâmetros também passaram.
- Os runners criam diretórios temporários em `/tmp` e os removem ao terminar.
  Este registro preserva comandos e marcadores de resultado, não os diretórios
  de compilação temporários.

## Resultados

| Comando | Resultado observado |
|---|---|
| `bash project/device/experiments/asic_mac4_i16_i8/run_test.sh` | PASS — 39 checks, 32 vetores, latência de dois ciclos. |
| `bash project/device/experiments/asic_reconstruction_f43/run_test.sh` | PASS — 1.002 vetores das transformações F(4,3), wrap de 16/32 bits. |
| `bash project/device/experiments/asic_reconstruction_f43/run_dot9_test.sh` | PASS — 258 reduções dot9, quatro produtos 16×16, soma com wrap de 32 bits, latência de três ciclos. |
| `bash project/device/experiments/asic_reconstruction_f43/run_tile_test.sh` | PASS — 128 tiles F(4,3), quatro multiplicadores 16×16, latência de 31 ciclos. |
| `bash project/device/experiments/opencl_memread_compute/run_accumulator_test.sh` | PASS — 22 tuplas de fração × 32 lanes × 6 posições. |
| `bash project/device/experiments/opencl_memread_compute/run_slice_test.sh` | PASS — slice Winograd/FC de 32 lanes, acumulação e saída fixed-point. |
| `bash project/device/experiments/opencl_memread_compute/run_test.sh` | PASS — 24 entradas em ciclos consecutivos; latência input-valid de 2 ciclos e II de saída 1 na fatia reconstruída, incluindo lane 31 e MAC 16×8. |
| `bash project/device/experiments/opencl_memwrite/run_test.sh` | PASS — ordem, padding, grupo z residual, stalls; 18 escritas por rota. |
| `bash project/device/experiments/opencl_pool/run_test.sh` | PASS — pooling signed 2×2, reutilização do line buffer e stalls. |
| `bash project/device/experiments/opencl_pool/run_system_test.sh` | PASS — pooling integrado a `memWrite`, 16 escritas verificadas com stalls. |
| `bash project/device/experiments/opencl_win_buffer/run_test.sh` | PASS — seis tiles, rotação dos slots, warm-up, máscaras e stalls. |
| `bash project/device/experiments/opencl_win_buffer/run_compute_test.sh` | PASS — três tiles F(4,3), acumulação de dois termos e quantização. |
| `bash project/device/experiments/opencl_win_buffer/run_counter_test.sh` | PASS — 20 iterações, término do loop, endereço e padding y. |
| `bash project/device/experiments/opencl_win_buffer/run_system_test.sh` | PASS — quatro latências de resposta (padrão variável 2–4, fixas 0/1/4); em todas, linha ativa 22 da configuração host com 1.392 iterações, 85 tokens e 578 endereços únicos, além do caso F(4,3) não nulo. |
| `python3 -m unittest discover -s project/device/experiments/opencl_win_buffer -p 'test_*.py' -v` | PASS — 2 testes para as 22 linhas host e padding de canais. |

O caso da linha ativa 22 usa palavras de feature determinísticas e não nulas, com peso e
bias zerados. Ele verifica contagem de iterações, término, roteamento,
endereços, stalls e drenagem da fila; não valida os valores aritméticos dessa
camada. A aritmética não nula é coberta pelos testes de compute reduzidos
indicados acima.

## Rechecagem do sistema integrado — 2026-10-07

Uma reinspeção encontrou que o bloco `initial` existente já zera os 24.576 bits
de `weight_word` com um loop, antes de iniciar os cenários. Portanto, não havia
estímulo indeterminado; a hipótese inicial estava errada. Uma inicialização
declarativa redundante foi tentada: `='0` disparou `WIDTHCONCAT` no Verilator
5.050, enquanto `WEIGHT_W'(0)` compilou e a simulação repetida passou com 1.392
iterações, 85 tokens e 578 endereços da linha ativa 22. O cast redundante foi removido;
o testbench final voltou à forma original, cujo `run_system_test.sh` já consta
como `PASS` na campanha inicial. O caso da linha ativa 22 continua com pesos e
bias zero e não valida sua aritmética não nula.

## Assertion temporal da fatia aritmética — 2026-10-07

Uma assertion nova passou a registrar os ciclos de aceitação e de saída no
teste `opencl_memread_compute`. Ela confirma 24 entradas realmente consecutivas,
latência de dois ciclos e uma saída por ciclo (II=1). A medição revelou que o
loop anterior do testbench mantinha `ivalid` alto por dois ciclos por vetor;
esse sequenciamento foi corrigido antes de registrar o novo `PASS`. A evidência
vale para a fatia aritmética source-level e não para o kernel AOCL completo.

## Sweep de latência do produtor de feature — 2026-10-07

O testbench integrado foi parametrizado por `+MEMORY_READ_LATENCY`; o valor
ausente mantém o atraso determinístico de 2–4 ciclos. O runner completo passou
com atrasos fixos de 0, 1 e 4 ciclos. Cada configuração processou 1.428 palavras
de feature e manteve os checks de estabilidade do endereço, `word_ready`,
roteamento, FIFO e escrita. As esperas modeladas foram 4.282 ciclos no modo
variável, 0, 1.428 e 5.712 ciclos nas configurações 0/1/4. Isso caracteriza
robustez da fronteira reconstruída `word_valid/data`, não a latência da RAM
global AOCL. Do reset até a drenagem da saída/FIFO, o testbench contou 6.965
ciclos no modo padrão e 2.791, 4.184 e 8.360 ciclos com latência fixa 0/1/4.
Essas contagens pertencem ao controlador reconstruído, produtor de memória
sintético e backpressure de saída; não são throughput do kernel AOCL.

## Limites

Esta campanha valida os módulos e wrappers source-level desta reconstrução. Ela
não demonstra equivalência ciclo a ciclo ao AOCL, latência de memória global,
hierarquia RTL Intel recuperada, II do kernel, bancos físicos ou métricas ASIC
de área, timing, potência e energia para o sistema completo. Genus, Xcelium e o
motor Joules integrado do Genus foram executados separadamente na fatia
aritmética reconstruída, conforme `asic-recovery-audit.md`; esse escopo não é o
sistema completo. O último estado remoto confirmado do run Genus do sistema foi
ativo às 21:53 BRT, sem netlist nem relatórios finais. A consulta posterior
falhou por DNS; o estado atual é desconhecido (seção AD da auditoria). Não houve
Xcelium do sistema completo nem execução standalone de Joules.
