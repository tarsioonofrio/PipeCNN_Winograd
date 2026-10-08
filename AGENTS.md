# AGENTS – PipeCNN_Winograd

## Objetivo

Atue como agente de pesquisa e engenharia para o repositório
`/home/tarsio/gaph/PipeCNN_Winograd`. Conduza tarefas de ponta a ponta usando
as fontes, configurações e ferramentas que realmente existem neste checkout.
Não transfira para este projeto as fronteiras, parâmetros, comandos ou
conclusões do SAURIA/FastConv sem verificar que se aplicam.

O projeto é um acelerador FPGA OpenCL para YOLOv2, derivado do PipeCNN e
modificado para usar convolução Winograd. Preserve esse fluxo e a arquitetura
existente. Não reescreva os kernels, o formato de dados ou o processamento de
pesos como se fosse um fluxo SystemVerilog/ASIC.

## Comunicação e autonomia

- Responda em português brasileiro por padrão, com linguagem direta e técnica.
- Quando o pedido for explicar, investigar ou revisar, inspecione os arquivos
  relevantes e apresente evidências sem editar o repositório.
- Quando o pedido for implementar, corrija ou documentar, faça a alteração
  local dentro do escopo, preserve trabalho preexistente e rode a validação
  local não destrutiva apropriada.
- Não invente que uma compilação, emulação, execução na FPGA, medição de
  potência ou resultado de desempenho ocorreu. Separe compilação AOCL,
  compilação de emulação, geração RTL, execução de host e teste em placa.
- Antes de qualquer rebuild destrutivo, preserve os relatórios e artefatos que
  precisem ser comparados. Não apague modificações, arquivos não rastreados,
  dados, pesos ou relatórios sem autorização explícita.
- Não instale AOCL, altere drivers, programe FPGA, execute comandos de sistema
  privilegiados ou faça publicação externa sem autorização específica.

## Estrutura e arquivos de referência

- `readme.md`: descrição, organização e comandos básicos deste checkout.
- `project/device/conv_pipe.cl`: kernels OpenCL do acelerador. O projeto
  descreve a variante Winograd como uma alteração do PipeCNN que organiza o
  fluxo em kernels de leitura e convolução/pós-processamento.
- `project/device/hw_param.cl`: parâmetros de arquitetura e buffers, incluindo
  `VEC_SIZE`, `W_VEC_SIZE`, `WEIGHT_W_VEC_SIZE`, `LANE_NUM`, `PIPE_DEPTH` e
  limites de pooling. Leia os valores ativos e seus comentários antes de
  alterar configuração ou interpretar resultados.
- `project/device/type_def.cl`: tipos OpenCL e canais tipados. Os tipos ativos
  incluem `DPTYPE=char`, `CONVTYPE=short` e `MACTYPE=int`; não os descreva como
  uma representação numérica comum a outro acelerador sem validar conversões,
  escalas fracionárias e máscaras no código.
- `project/device/RTL/`: RTL/IP integrado ao build OpenCL. A biblioteca AOCL é
  descrita em `project/device/RTL/rtl_lib.xml`; a regra para regenerá-la está
  em `project/device/RTL/Makefile` (`make lib`). Quando RTL/IP mudar, verifique
  se a biblioteca precisa ser recompilada e regenere-a com a versão AOCL
  correta antes de compilar o kernel.
- `project/host/` e `common/`: aplicação host e utilitários OpenCL.
- `data/picture/picture.jpg`: imagem usada pelo script de teste de host.
- `data/weight/model/`: modelo e configuração de rede. `data/weight/weight_gen.sh`
  e `modelWinogradCut.py` preparam pesos; inspecione entradas, saídas e efeitos
  antes de executá-los ou substituir arquivos de dados.

## Ambiente e fluxos de compilação

Execute os scripts a partir de `project/`, porque eles usam caminhos relativos:

```bash
cd /home/tarsio/gaph/PipeCNN_Winograd/project
```

- **Build FPGA de hardware:** `./run_fpga.sh`. O script seleciona
  `../init_aocl_a10gx_18_0`, executa `make clean` e chama `aoc -seed=6
  -report` para `./device/conv_pipe.cl`, incluindo `device/RTL/rtl_lib.aoclib`.
  O checkout documenta Intel Arria 10 e AOCL 18.0/19.1; confirme a instalação,
  board/part e versão realmente selecionadas antes de cada campanha. Não
  substitua silenciosamente SDK, FPGA, seed ou frequência.
- **Build de emulação:** `./run_emu.sh`. Usa o setup AOCL 18.0, limpa saídas,
  compila o host e chama `aoc -march=emulator`. O script compila; ele não
  executa automaticamente `run.exe` nem demonstra, sozinho, a correção de
  uma inferência completa.
- **Geração RTL/sintaxe:** `./run_syntax.sh`. Usa
  `/home/share/init_aocl_a10gx_19_1`, limpa as saídas e chama `aoc -rtl` com
  `conv_pipe.cl`. Isso é geração/compilação de RTL pelo AOCL, não é uma
  simulação funcional nem uma síntese ASIC.
- **Host:** `make host` constrói `project/run.exe`. `./fpga_test.sh` executa
  `run.exe ../data/picture/picture.jpg`; só faça esse teste quando o ambiente
  OpenCL/dispositivo necessário estiver pronto. Uma saída de compilação ou do
  host sem dispositivo válido não deve ser chamada de resultado FPGA.
- **Teste manual em placa:** o build FPGA gera `project/conv_pipe.aocx`, nome
  esperado pelo host. Programe/inicialize a placa somente segundo o ambiente
  local autorizado e registre qual dispositivo foi usado.
- **Biblioteca RTL:** quando a RTL integrada for alterada, avalie e, se
  necessário, compile `project/device/RTL/rtl_lib.aoclib` com `make lib` em
  `project/device/RTL/`, usando o ambiente AOCL suportado. O próprio Makefile
  avisa que a biblioteca deve ser recompilada após mudanças de RTL.

Antes de executar um fluxo, leia seu script e os alvos `clean` dos Makefiles.
`project/run_fpga.sh`, `project/run_emu.sh` e `project/run_syntax.sh` fazem
limpeza antes da compilação; não os rode antes de arquivar saídas de uma
execução que ainda precise ser preservada.

## Relatórios e preservação de resultados

- O projeto AOCL do kernel é `project/conv_pipe/`; o relatório HTML do build
  FPGA fica em `project/conv_pipe/reports/report.html`, e os demais relatórios
  e intermediários ficam sob `project/conv_pipe/`.
- `project/device/RTL/mult_add_fix8bx16bx4/*_generation*.rpt` são relatórios
  da geração daquela IP, não do acelerador YOLOv2 completo.
- `reports/` é o arquivo manual de campanhas; os scripts de build não o
  atualizam automaticamente. Antes de qualquer rebuild que execute `make
  clean`, arquive o diretório de compilação completo em um nome único, por
  exemplo:

  ```bash
  mkdir -p reports/<rotulo-unico>
  cp -a project/conv_pipe reports/<rotulo-unico>/
  ```

- Para cada compilação preservada, registre pelo menos revisão Git, AOCL,
  setup selecionado, board/part, fluxo (`hw`, `hw_emu` ou `sw_emu`), comando,
  data, status de saída e localização do relatório. Calcule checksum do
  `conv_pipe.aocx` quando a identidade do artefato for importante.
- Mantenha separados relatórios do compilador, resultado de emulação, execução
  em placa, estimativa de potência do compilador e medição de potência física.
  `-report` não equivale a uma medição de placa.
- Consulte `reports/README.md` para o mapa atual dos artefatos e o procedimento
  de arquivamento. Preserve arquivos já existentes nesse diretório.

## Dados, configurações e interpretação

- A configuração ativa em `project/device/hw_param.cl` inclui
  `VEC_SIZE=16`, `W_VEC_SIZE=6`, `WEIGHT_W_VEC_SIZE=6`, `LANE_NUM=32`,
  `CONV_GP_SIZE_X=4`, `CONV_GP_SIZE_Y=1` e `PIPE_DEPTH=6`. O próprio código
  declara que `CONV_GP_SIZE_Y` deve ser 1. Esses são valores do checkout atual,
  não limites universais do projeto; verifique restrições nos kernels antes de
  testar outra combinação.
- O gerador de pesos pode produzir/preparar dados derivados para Winograd.
  Documente exatamente qual modelo, corte, quantização, layout e script gerou
  cada conjunto usado. Não compare dados brutos com pesos transformados como
  se tivessem a mesma semântica.
- Relate separadamente forma de compilação, precisão, parâmetros ativos,
  ferramenta/versão, dispositivo alvo e resultado funcional. Não deduza MACs,
  latência, GOPS, uso de DSP, área ou potência física somente a partir de um
  parâmetro ou do HTML do AOCL.
- Não presuma que o repositório oferece um fluxo Genus/ASIC, acesso Paxos,
  testbench SystemVerilog independente ou dataset de golden completo. Procure
  suporte real no checkout e identifique o limite entre o que foi compilado e
  o que foi validado.

## Git e revisões

- No início, confira `git status --short --branch`, revisão e arquivos
  modificados. Preserve mudanças preexistentes e arquivos não rastreados.
- Faça commits focados quando solicitados ou autorizados para esta tarefa;
  nunca inclua incidentalmente alterações de README, `reports/`, pesos,
  binários ou saídas do compilador.
- Não use `git clean`, `git reset --hard` ou padrões de limpeza amplos para
  recuperar uma compilação. Inspecione e arquive primeiro o conteúdo exato.
