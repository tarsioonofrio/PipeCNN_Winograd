# Auditoria inicial para recuperação RTL e síntese ASIC

## Escopo e estado observado

- Repositório: `PipeCNN_Winograd`, revisão `5f767b4882d039d47e0a7aeaeceb2495266b9168`.
- A auditoria é estática; os fontes originais `project/device/conv_pipe.cl`,
  `hw_param.cl` e `type_def.cl` não foram alterados.
- O checkout tem arquivos e diretórios não rastreados anteriores a este
  relatório. Eles foram preservados.
- Ferramentas locais: `verilator` e `tclsh` disponíveis; `aoc`, `aocl`,
  `quartus_sh`, `genus` e `xrun` não encontrados no `PATH`. A instalação
  `/opt/intelFPGA/20.1` encontrada contém ModelSim ASE, mas a busca não encontrou
  AOCL, Quartus ou modelo Verilog de `altera_mult_add` nela.
- Paxos foi acessada por SSH e um checkout limpo foi criado em
  `/sim/tarsio/PipeCNN_Winograd`, commit
  `5f767b4882d039d47e0a7aeaeceb2495266b9168`, igual ao workspace local.
- `module load quartus/18.1` disponibiliza AOCL 18.1.0 Build 625 Standard
  Edition e BSP `a10gx` em
  `/soft64/altera/ferramentas/quartus/18.1/hld/board/a10_ref`. O módulo não
  inclui `aoc` no `PATH`; isso foi configurado apenas no shell da compilação.
- O MODULEPATH da Paxos oferece Quartus 18.1 Standard, mas não Quartus Pro.
  Também oferece Genus 21.1, Xcelium 23.03 e Joules pelo módulo
  `cadence/jls/16.10` (versão v16.10-p003_1). O módulo expõe o executável
  `joules` e a licença `Joules_RTL_Power`; a versão/ajuda foram consultadas,
  mas nenhuma análise de potência foi executada.
- Foi inspecionada uma segunda cópia em
  `/home/tarsio/gaph/iscas2027-data-fast/repos/PipeCNN_Winograd`; nela também
  só foram encontrados os wrappers/RTL do IP MAC e `rtl_lib.aoco`, sem `.aocr`,
  `.aocx`, diretório `conv_pipe/` ou RTL completo do kernel.

## A. Microarquitetura que o OpenCL expressa

`conv_pipe.cl` contém dois kernels ativos, `memRead` e `memWrite`. A computação
Winograd está dentro de `memRead`; o host cria esses dois kernels. As referências
host a `coreConv`, pooling e reordenação de escrita aparecem desativadas.

O caminho de dados estático em `memRead` é:

1. Lê blocos de `bottom` e avança índices de grupo, linha e canal.
2. Guarda/recombina dados em `win_buffer[WIN_BUF_SIZE][3]`. O seletor `flag`
   percorre 0, 1 e 2; a declaração ativa usa `numbanks(4)` e `bankwidth(64)` na
   configuração `VEC_SIZE=16`.
3. Lê pesos e bias de memória global para `weight_buffer`, declarado com
   `numbanks(1)`.
4. Monta uma janela de seis posições, aplica a transformação de entrada
   escrita como `BT*d` (com bypass para `fc_en`) e combina os valores com os
   pesos transformados.
5. Calcula quatro grupos de quatro produtos por posição `n` quando
   `VEC_SIZE=16`; soma os quatro resultados do MAC de cada grupo.
6. Aplica as equações de saída `A^T` presentes no código, acumula em
   `conv_out` durante `conv_loop_cnt`, depois faz deslocamento de escala,
   bias, saturação para `char` e ReLU opcional.
7. Executa pooling com `line_buf_0` ou envia o resultado pelo canal de bypass.
   `memWrite` lê `pool_ch` ou `bypass_ch` e grava em `top`.

Parâmetros ativos em `hw_param.cl`: `VEC_SIZE=16`, `W_VEC_SIZE=6`,
`WEIGHT_W_VEC_SIZE=6`, `LANE_NUM=32`, `PIPE_DEPTH=6`,
`FPGA_DSP_NUM=1518*2=3036`, `WIN_BUF_SIZE=WEIGHT_BUF_SIZE=96` e
`POOL_LBUF_DEPTH=136`.

No caminho principal, cada lane de saída e cada posição `n` recebe 16 termos de
produto, organizados em quatro chamadas a um operador de quatro produtos. O
código expressa `16*6*32=3072` produtos por conjunto paralelo de posições,
mas isso não comprova a contagem física após compilação. Como esse valor excede
3036, a condição para `VEC_SIZE=16` usa o operador customizado em `ll<31` e
expressões de multiplicação OpenCL na última lane. O relatório RTL/recursos do
AOCL precisa confirmar o mapeamento efetivo.

No ramo condicional efetivo, as diretivas `#pragma unroll` cobrem `ll`, `m` e
`n`: lanes 0–30 emitem quatro chamadas `mult_add_fix8bx16bx4` para cada uma das
seis posições, enquanto lane 31 emite a expressão direta com 16 multiplicações.
Isso corresponde a 31×6×4=744 instâncias declaradas do MAC customizado, ou
2976 produtos, mais 6×16=96 produtos diretos. É a expansão do código, não uma
contagem física pós-síntese.

Capacidades lógicas deduzidas dos tipos e parâmetros ativos:

| Buffer | Declaração e atributo OpenCL | Capacidade lógica calculada |
|---|---|---|
| `win_buffer` | `[96][3]` de `intvec` (`int16`, 16×32 bits), `numbanks(4)`, `bankwidth(64)` | 96×3×512 bits = 147456 bits = 18 KiB |
| `weight_buffer` | 96 de `channel_vec_wng`; por entrada, 32 lanes×16 vetores×6 `char`, `numbanks(1)` | 96×3072 bytes = 288 KiB |
| `line_buf_0` | 136 de `pool_vec_wng`; por entrada, 32 lanes×2 `char`, `numbanks(1)` | 136×64 bytes = 8704 bytes (8.5 KiB) |

Esses totais descrevem armazenamento lógico dos tipos declarados. Não provam
quantas SRAMs, registros, portas físicas, replicações ou otimizações o AOCL
produz. O guia Intel FPGA SDK for OpenCL Standard Edition define `bankwidth`
em bytes e `numbanks` como número de bancos; portanto, para o `intvec` ativo,
`bankwidth(64)` solicita bancos de 64 bytes (512 bits), exatamente a largura
lógica de um `int16`. Com 288 elementos de 64 bytes e quatro bancos, a
geometria solicitada equivale a 72 palavras de 512 bits por banco. A
documentação Standard Edition também descreve a seleção por bits menos
significativos quando `bank_bits` não é especificado; isso sugere, para o
layout linearizado, `bank=(3*win_itm_xyz+slot) mod 4` e
`word=floor((3*win_itm_xyz+slot)/4)` dentro do banco.
Essa é uma inferência de mapeamento a partir da documentação, não evidência do
relatório produzido pelo AOCL usado para compilar o kernel. Consulte o
[Programming Guide oficial da Intel, seção de atributos de memória](https://www.intel.com/programmable/technical-pdfs/683342.pdf).

Sob essa hipótese de seleção, cada iteração escreve um slot e lê os outros
dois. Para `win_itm_xyz=0`, `flag=0` escreve slot 0/banco 0 e lê slots 1/2 nos
bancos 1/2; `flag=1` escreve slot 1/banco 1 e lê 2/0 nos bancos 2/0; `flag=2`
escreve slot 2/banco 2 e lê 0/1 nos bancos 0/1. Para outros índices externos,
os três bancos rotacionam juntos, permanecendo distintos. Isso explica como
quatro bancos podem servir o padrão fonte de uma escrita e duas leituras por
posição; não estabelece o número real de portas, latência, replicação ou
implementação em RAM/registradores.

O fluxo lê `win_buffer[win_itm_xyz][flag & 3]` e seleciona dois slots entre os
três valores circulares de `flag`, combinando-os em seis posições para a
transformação. Os casos de borda quando `weight_dim1==3` escrevem zeros nas
posições superiores conforme `conv_row_rem`. Os pesos são carregados para
`weight_buffer` no caso de grupo indicado pelo código (`gp_num_x==2 &&
gp_num_y==0`) e depois lidos por `win_itm_xyz`. O host calcula
`conv_loop_cnt=weight_h*weight_n/16`; `conv_out` limpa em `conv_z_cnt==0`, soma
cada resultado transformado e executa bias/quantização quando o contador chega
ao último termo. O laço total acrescenta duas janelas ao número de grupos, mas
isso não basta para atribuir uma latência ou II em ciclos ao hardware.

Há uma dependência fonte-level importante em `weight_buffer`: sob a condição
`gp_num_x==2 && gp_num_y==0`, a iteração escreve
`weight_buffer[win_itm_xyz]` a partir de `weights[out_idx_z*win_size +
win_itm_xyz]` e logo depois lê `weight_buffer[win_itm_xyz]` sem condição para
alimentar `mac_weight`. A execução deve consumir o valor recém-carregado nessa
iteração; a implementação pode exigir encaminhamento do dado, uma porta de
leitura/escrita adequada ou escalonamento. `numbanks(1)` sozinho não revela qual
dessas soluções o AOCL escolheu, nem a largura real da memória, a latência ou o
comportamento read-during-write. O bias correspondente é lido no mesmo bloco e
fica em `bias_ch_in` para ser transferido a `bias_ch_out` quando
`conv_z_cnt==0`.

No caminho de pooling (`(control & 0x02)==0`) que trata o resultado final da
acumulação, `line_buf_0[line_buf_ptr]` é lido para `row_pool_reg`, usado junto
com o resultado corrente para calcular os máximos horizontais/verticais, e o
mesmo endereço é então sobrescrito com os máximos horizontais correntes. É um
read-modify-write que requer o valor anterior da linha; não pode ser modelado
como write-first sem encaminhar explicitamente o dado antigo. O registro lógico
tem 64 bytes (32 lanes × 2 `char`), e a iteração lê e grava os 32 lanes no
mesmo endereço. `line_buf_ptr` percorre `col_size` entradas e volta a zero; os
contadores de linha e pooling determinam quando `pool_ch` recebe o resultado.
O código não inicializa explicitamente `line_buf_0`; a validade do primeiro
valor lido depende do controle/ciclo em que o kernel libera a saída. A porta,
latência, modo read-during-write e memória física continuam sem evidência AOCL.

Na configuração host versionada, as camadas com `pool_on=1` usam
`pool_size=2` e `pool_stride=2` (Layer-1, 2, 5, 8 e 13). As linhas com
`pool_size=3` têm pooling desligado. Assim, o caminho efetivamente exercitado
pelo host é 2×2/stride-2: dois máximos horizontais combinados com a linha
anterior e uma saída a cada segunda linha. Embora o comentário OpenCL mencione
tamanho até 3, a sequência de `pool_max` mostrada combina apenas dois pares
horizontais e uma linha anterior; não comprova uma janela 3×3 geral.

As fronteiras entre kernels usam dois canais ativos de largura
`sizeof(channel_wvec_wng)=32 lanes × 6 char = 192 bytes (1536 bits)`.
`memRead` grava `bypass_ch` quando `(control & 0x02)!=0` e, no caminho de
pooling, grava `pool_ch` quando `row_pool_cnt==pool_size-1`; `memWrite` lê
exatamente um deles conforme `bypass & 1`. Ambos declaram
`depth(CHN_DEPTH)` com `CHN_DEPTH=0`. No guia Intel Standard Edition, `depth(N)`
é uma profundidade mínima; logo o `0` do fonte não determina a profundidade
implementada, que pode ser aumentada pelo compilador para satisfazer o
escalonamento. O RTL/relatório AOCL é necessário para obter profundidade,
latência, backpressure e implementação final do FIFO. As declarações `data_ch`,
`weight_ch[]`, `bias_ch` e `conv_ch` existem, mas os acessos correspondentes no
caminho examinado estão comentados; `bias_ch` ainda tem atributo `depth(8)`.
Referência: [Programming Guide oficial Intel Standard Edition, seção de
canais](https://www.intel.com/programmable/technical-pdfs/683342.pdf).

No host, `memRead` e `memWrite` recebem filas de comando distintas; o host
enfileira a tarefa de leitura e depois a tarefa de escrita sem dependência por
evento entre elas. Isso permite a execução concorrente necessária para os
canais, mas não revela por si só o escalonamento interno do dispositivo. O
host espera o evento final de `memWrite`; ele libera o evento de `memRead` sem
esperá-lo explicitamente. Isso também não substitui a análise das profundidades
e do comportamento de stall dos canais no hardware. A exigência de filas
distintas está descrita no [guia Intel 18.1 para execução concorrente de
kernels](https://docs.altera.com/r/docs/683342/18.1/fpga-sdk-for-opencl-standard-edition-programming-guide/requirement-for-multiple-command-queues-to-execute-kernels-concurrently).

O roteamento dos dois lados concorda no host: o bit 1 de `conv_control` é
`~pool_on`, e `pool_bypass` também é `~pool_on`. Assim, com pooling habilitado
(`pool_on=1`), `memRead` produz em `pool_ch` e `memWrite` lê `pool_ch`; com
pooling desabilitado, ambos selecionam `bypass_ch`.

Não há `#pragma ii` ativo no caminho principal. `PIPE_DEPTH=6` é definido no
arquivo de parâmetros, porém não é usado por expressões ativas de
`conv_pipe.cl`; existe apenas num comentário sobre `MASK_ACCUM`. Portanto,
nenhum II ou pipeline de seis estágios está especificado diretamente pelo
código que foi recuperado.

Os tipos originais são `DPTYPE=char`, `CONVTYPE=short` e `MACTYPE=int`.
Portanto, o MAC original é 16×8 signed, não 16×16. A variante local
`int16_4mul_per_channel` e `mac4_int16.sv` é uma experiência separada e não
define a microarquitetura original nem consta em `rtl_lib.xml`.

### Interfaces visíveis no OpenCL e preparação de dados

`memRead` recebe parâmetros de dimensão/agrupamento, `bottom` como `int16`
(512 bits com `VEC_SIZE=16`), pesos tipados `channel_vec_wng` e bias
`channel_scal`; seus controles incluem `conv_loop_cnt`, flags de pooling/ReLU
e frações fixas. `memWrite` recebe as dimensões de saída e grava `top` como
`lane_data` (32 valores `char` por elemento no arranjo ativo). Entre eles, os
canais tipados incluem `conv_ch`, `pool_ch` e `bypass_ch`. Essas são interfaces
de alto nível do kernel: clock, reset, sinais RTL de handshake, protocolo de
stall e temporização ciclo a ciclo não são especificados diretamente nesses
parâmetros e continuam dependentes do RTL AOCL.

O host do YOLOv2 configura imagem de entrada de 548×544×3 e seleciona saída
17×17×32 da Layer-22 no arquivo de configuração ativo. Logo, a entrada 3×32×32
e saída 3×30×30 mencionadas para o experimento atual não correspondem ao
workload host ativo do PipeCNN e precisam ser tratadas como workload de
avaliação separado; esta auditoria não as atribui ao modelo original.

O preparo de pesos também faz parte do contrato: `modelWinogradCut.py`
aplica a transformação Winograd aos filtros e bias e quantiza pesos para
`char`; o host aloca os pesos já transformados. Não se pode alimentar diretamente
filtros 3×3 crus ao caminho RTL e chamar isso equivalente ao fluxo original.
O modelo Caffe, a transformação/quantização e o layout usados precisam ser
congelados para uma comparação funcional reproduzível.

### Escrita de saída fonte-level (`memWrite`)

`memWrite` consome um token de `bypass_ch` quando `bypass&1` é 1; nos demais
casos consome `pool_ch`. Um token é declarado como `channel_wvec_wng`, com 32
entradas `lane`, cada uma contendo seis bytes. Para cada posição de largura,
`memWrite` copia 16 desses bytes para um `lane_data` de saída. O grupo de lane
é selecionado por `lane_cnt*VEC_SIZE+k` (`VEC_SIZE=16`); `lane_cnt` avança
depois que as posições de largura do grupo foram processadas.

O endereço fonte-level de escrita é:

```text
(z_dim + lane_cnt) * out_dim1xdim2
  + y_dim * out_dim1
  + x_dim * q_vec
  + padding_tmp
  + width_cnt
```

`out_dim1xdim2` é `out_dim1*out_dim2`. Assim, os grupos de 16 canais são
separados por um plano de `out_dim1*out_dim2` elementos, enquanto os grupos
espaciais `x_dim` avançam por `q_vec` posições. A tabela resume a seleção da
faixa de largura:

| Condição fonte-level | `width` | `loop_num` |
|---|---:|---:|
| Grupo z final e primeiro grupo x | `start_size_x` | `scal_rem_zxstart_size_x` |
| Grupo z final e último grupo x | `rem_size_x` | `scal_rem_zxrem_size_x` |
| Grupo z final, grupo x interno | `q_vec` | `scal_rem_zxq_vec` |
| Grupo z completo e primeiro grupo x | `start_size_x` | `scalxstart_size_x` |
| Grupo z completo e último grupo x | `rem_size_x` | `scalxrem_size_x` |
| Grupo z completo, grupo x interno | `q_vec` | `scalxq_vec` |

No primeiro grupo x, quando há padding da próxima camada, `width_cnt==0`
produz zero e as posições seguintes usam o índice `width_cnt-1` do token.
No grupo x final, `width_cnt==rem_size_x-1` produz zero com padding. Nos demais
casos, a origem é `width_cnt`. Esses zeros são escritos em `top`; o código não
descreve uma porta de padding ou um ciclo separado para eles.

O host escolhe `q_vec=2` para pooling e `q_vec=4` para as convoluções com
`weight_w` igual a 1 ou 3. Ele deriva `start_size_x` e `rem_size_x` incluindo o
padding da próxima camada, arredonda `memWr_dim1` para múltiplo de quatro
(exceto na última camada), e fornece contadores distintos para grupo z
completo e grupo z residual. O bit `pool_bypass=~pool_on` seleciona o canal
consistente com o produzido por `memRead`, conforme descrito acima.

Esse mapeamento reconstrói a ordem lógica e as condições de borda da escrita
em memória a partir do OpenCL e do host. Não informa quantos ciclos uma
transação ocupa, o protocolo de memória global gerado, a largura/fragmentação
física das escritas, a política de stall, nem a sobreposição temporal entre
`memRead` e `memWrite`. Esses pontos ainda exigem RTL AOCL ou relatórios da
compilação original; portanto, o caminho de saída ainda não está validado em
equivalência temporal.

## B. RTL disponível

O repositório contém o wrapper
`project/device/RTL/mult_add_fix8bx16bx4/mult_add_fix8bx16bx4.v`, a hierarquia
gerada que instancia `altera_mult_add`, e artefatos de simulação/síntese do IP.
`rtl_lib.xml` referencia esse wrapper e o Verilog gerado de `altera_mult_add`.
O `rtl_lib.aoco` local contém metadados que confirmam quatro multiplicadores,
larguras A=16, B=8 e resultado interno=26. O wrapper estende esse resultado
signed para 32 bits. A especificação XML declara latência fixa 2; a configuração
gerada define `input_register_a0..a3`, `input_register_b0..b3` e
`output_register` como `CLOCK0`. Os parâmetros `input_a*_latency_clock` e
`input_b*_latency_clock` aparecem como `UNREGISTERED`, mas são distintos dos
parâmetros `input_register_*`; não são evidência de ausência dos registros de
entrada. O wrapper também fixa `ovalid=1`, `oready=1` e ignora `ivalid`,
`iready` e `resetn`. O contrato XML é stall-free, latência fixa 2, capacidade
1. A convenção exata de ciclos ainda requer simulação da hierarquia original.

Há também `mult_add_fix8bx16bx4/synth/mult_add_fix8bx16bx4.v`, cuja interface
difere do wrapper escolhido pelo XML: declara A=8 e estende identificadores
`result_26`/`result_26b` de forma inconsistente. Não deve ser selecionado como
substituto sem esclarecer sua origem.

Não há neste checkout uma hierarquia RTL completa do kernel `memRead`/`memWrite`,
um `project/conv_pipe.aocr`, nem diretório de compilação
`project/conv_pipe/`. O `.aoco` encontrado é a biblioteca de usuário do MAC,
não uma netlist do acelerador.

## C. Versão Intel necessária

- `run_fpga.sh` seleciona o ambiente AOCL 18.0.
- O wrapper do MAC registra geração por ACDS 18.0.1 build 261.
- `run_syntax.sh` seleciona outro setup, AOCL 19.1, e chama `aoc -rtl`.
- Na Paxos, foi confirmado AOCL 18.1.0 Build 625 Standard Edition. O BSP
  `a10gx` está instalado, mas o Quartus associado é Standard; não há módulo ou
  instalação Quartus Pro entre os módulos e caminhos Altera examinados.
- Uma busca adicional de executáveis em `/soft64`, `/opt`, `/usr/local` e
  `/home/share` encontrou `aoc` e `quartus_sh` apenas na instalação 18.1, além
  de `quartus_sh` das versões antigas 11.1/12.0/12.0-SP2. Não encontrou uma
  instalação Pro fora do MODULEPATH.
- O artigo dos autores especifica Intel OpenCL SDK 18.0 Pro e Arria-10 GX1150
  para o experimento (seção IV-A). O README do repositório registra SDK 18.0/
  19.1, sem qualificar a edição. Referências: [artigo dos autores, cópia pública
  do conteúdo enviado pelo autor](https://www.researchgate.net/publication/339024182_An_OpenCL-Based_FPGA_Accelerator_for_Compressed_YOLOv2)
  e [repositório PipeCNN_Winograd](https://github.com/williamyang4978/PipeCNN_Winograd).
- O mesmo host tem Genus 21.12-s068_1, Xcelium/xrun 23.03-s003 e Joules
  v16.10-p003_1. Já foi executado no Paxos o fluxo ASIC da fatia aritmética
  reconstruída: Genus, simulação Xcelium e estimativa de potência pelo motor
  Joules integrado ao Genus. O run Genus do sistema reconstruído continua sem
  relatórios/netlist finais; Joules standalone continua sem licença.

### Busca das alternativas de recuperação 1 e 2

- A listagem de módulos Quartus na Paxos oferece somente 11.1, 12.0, 12.0-SP2
  e 18.1. Não há módulos Quartus 18.0/19.1 nem Quartus Pro.
- O setup `/home/share/init_aocl_a10gx_19_1` referenciado pelo fluxo local está
  ausente na Paxos; a busca em `/home/share` também não encontrou esse setup,
  o setup 18.0 nem um `aoc` próprio nessa árvore.
- A busca de arquivos de projeto/saída em `/sim/tarsio` não encontrou `.aocr`,
  `.aocx`, `.qpf`, `.qsf` nem `conv_pipe*.v`. Os `.qdb` encontrados ficam no
  repositório preexistente `acc_dse_env`; seu README o identifica como outro
  fluxo de DSE para acelerador CNN. Os arquivos desse projeto não foram
  alterados nem usados para inferir a hierarquia do PipeCNN.
- Em 2026-10-07, a API pública do GitHub listou nove forks. Foram inspecionadas
  as árvores recursivas de todos os nove: cada fork tem somente a branch `master`
  e nenhum publica tags. Todos expõem os mesmos sete arquivos `.v` da hierarquia
  de geração/simulação do IP `mult_add_fix8bx16bx4` e `rtl_lib.aoco`; não foi
  encontrado `.aocr`, `.aocx`, `.qpf`, `.qsf`, `.sv` ou RTL `conv_pipe` fora
  desse IP MAC. Os arquivos de MAC já estão no checkout original, portanto os
  forks não acrescentaram artefatos para reconstruir a hierarquia do kernel.
  A inspeção foi por nomes e árvores Git públicas, sem baixar nem executar os
  conteúdos dos forks. Referências: [repositório PipeCNN_Winograd](https://github.com/williamyang4978/PipeCNN_Winograd)
  e [API pública de forks](https://api.github.com/repos/williamyang4978/PipeCNN_Winograd/forks?per_page=100).
  Os nove repositórios consultados foram `tarsioonofrio`, `hao310rui140326`,
  `xry644854073`, `Miinuuuu`, `ShouboLee`, `TaihuLight`, `marenan`, `fox6666`
  e `zzulb`, todos com o nome de repositório `PipeCNN_Winograd`.
- O repositório público do autor mostra o código-fonte e scripts de build, sem
  release/artefato AOCL gerado publicado na página consultada. A busca local
  ampliada em `/sim/tarsio` e no home `/home/tarsio.onofrio` também não encontrou
  `.aocr`, `.aocx` ou HDL de `conv_pipe`; o `.aoco` remanescente é somente
  `rtl_lib.aoco`.
- Em 2026-10-07, uma busca por nomes/formatos em `/home/tarsio/gaph` e depois
  no home local `/home/tarsio` (excluindo caches, `node_modules` e Trash) não
  encontrou `.aocr`, `.aocx`, `.qpf`, `.qsf`, `conv_pipe*.aoco`,
  `conv_pipe*.v` ou `conv_pipe*.sv`.
- A adaptação do fluxo isolado da fatia foi executada em Paxos: Xcelium gerou o
  VCD, e Genus leu a atividade e concluiu `report_power` usando seu motor Joules
  integrado. Joules standalone 16.10 não foi iniciado porque as licenças
  `Joules_RTL_Power`/`Joules_Power_SP` não são anunciadas; detalhes, escopo e
  hashes estão nas seções O/P e nos manifests correspondentes.
- A alternativa 1 permanece sem um ambiente 18.0/19.1 compatível para teste;
  a alternativa 2 não localizou artefatos recuperáveis no host nem nos forks
  públicos examinados. A compilação com Quartus Pro/AOCL compatível em outro
  host continua sendo o caminho de recuperação original ainda aberto.

## D. Resultado possível com `aoc -rtl -save-temps`

O parser do AOCL 18.1 aceita `-rtl` e `-save-temps` (sondado com caminho de
entrada inexistente, sem iniciar compilação). A tentativa real, executada no
checkout isolado, parou antes da análise do kernel com:

```text
aoc: Use Quartus Prime Pro Edition for A10/S10 devices.
Current Quartus Version is: Quartus Prime Shell 18.1.0 Build 625 Standard Edition
```

O comando foi executado em `/sim/tarsio/PipeCNN_Winograd/project`:

```bash
aoc -rtl -save-temps -report -board=a10gx \
    -I device/RTL -L device/RTL -l device/RTL/rtl_lib.aoclib \
    -g ./device/conv_pipe.cl
```

Não foram produzidos `.aocr`, relatórios nem HDL do kernel; a árvore de trabalho
remota continua limpa. Portanto, a capacidade de `-rtl -save-temps` recuperar a
hierarquia deste kernel ainda não foi testada. É necessário Quartus/AOCL Pro
compatível com Arria 10. Não chamar `run_syntax.sh`/`run_fpga.sh`: eles executam
`make clean`.

## E. Dependências que impedem síntese independente de FPGA

- A biblioteca OpenCL habilita `cl_intel_channels`; `pool_ch` e `bypass_ch`
  conectam os dois kernels.
- `__local` buffers dependem de atributos Intel de bancos e largura de banco.
- `mult_add_fix8bx16bx4` instancia `altera_mult_add`, selecionado para Arria 10.
- O compilador gera os wrappers de kernel, interfaces de memória, FIFOs/canais,
  controle e escalonamento a partir de OpenCL; esses blocos não estão no RTL
  versionado.
- O host OpenCL, buffers e dados de pesos do YOLOv2 não são uma interface ASIC.

Dependências identificadas no código-fonte e no IP disponível:

| Elemento | Classe conhecida | Evidência e efeito para ASIC |
|---|---|---|
| `mult_add_fix8bx16bx4` | B — wrapper Intel | Adapta a interface RTL customizada ao IP; handshake é ignorado no wrapper. |
| `altera_mult_add` | C — primitiva Intel para FPGA | Configurada com quatro produtos signed 16×8 e resultado de 26 bits; requer substituição compatível. |
| `cl_intel_channels` / `pool_ch` / `bypass_ch` | B — extensão do compilador | Dois canais ativos transportam tokens de 1536 bits e declaram `depth(0)`, que não fixa a profundidade implementada; FIFO, stalls e latência dependem dos relatórios AOCL. Outros canais declarados têm acessos comentados no caminho atual. |
| Buffers `__local` com `numbanks`/`bankwidth` | Geometria declarada conhecida; implementação física indeterminada | O fonte define quatro bancos de 64 bytes para `win_buffer` e um banco para cada outro buffer; largura de `weight_buffer`/`line_buf_0`, portas, latência, replicação e células físicas dependem do compilador e não foram recuperadas. |
| `altsyncram`, `scfifo`, `dcfifo` e outros módulos gerados | Não determinado | A ausência do RTL completo impede confirmar ou descartar instâncias além do IP MAC encontrado. |

## F. Menor adaptação ASIC após recuperar RTL

1. Manter a hierarquia, os operadores, os registradores, o controle e a ordem
   de operações que o AOCL gerou.
2. Trocar somente `altera_mult_add` por RTL signed 4×(16×8), com o mesmo
   resultado interno de 26 bits, saída de 32 bits e latência confirmada.
3. Implementar as memórias/bancos com SRAM macros ou modelos sintetizáveis que
   preservem portas, latência e política de leitura/escrita do RTL recuperado.
4. Substituir os canais Intel por FIFOs/handshakes cycle-equivalent e manter
   as fronteiras entre `memRead` e `memWrite`.
5. Definir wrappers externos de entrada/saída e SDC sem alterar o núcleo.

Esses passos são uma hipótese de adaptação mínima; portas, dimensões e ciclos
reais dependem do RTL gerado e ainda não foram confirmados.

## G. Preservação arquitetural

O código-fonte mostra o algoritmo, os loops e os atributos de memória. O XML
registra o contrato do MAC e o IP mostra sua configuração de multiplicadores.
Isso não prova preservação do paralelismo físico, pipeline completo, latência,
II, FSMs, organização final dos bancos ou comportamento de canais. Esses pontos
dependem do RTL AOCL e dos relatórios de compilação ausentes.

| Característica | Estado | Evidência e limite |
|---|---|---|
| Transformações F(4,3) de entrada `BT*d` e saída `A^T` | Expressas no OpenCL; não recuperadas como RTL AOCL | As equações estão em `conv_pipe.cl`; não houve compilação que revele largura efetiva, cortes de bits ou registradores inseridos. |
| Buffers `win_buffer` e `weight_buffer` | Reconstruídos funcionalmente em modelo reduzido e conectados à fatia aritmética F(4,3) | `pipecnn_win_buffer3.sv` implementa rotação, seletores, warm-up e as máscaras sob `gp_num_x==1 && weight_dim1==3`. `pipecnn_weight_buffer.sv` modela armazenamento indexado e encaminhamento no mesmo endereço. `pipecnn_memread_buffered_compute.sv` conecta contadores, ambos buffers, transposição, transformações F(4,3), acumulação e saída quantizada; o teste integrado verifica três tiles e a carga em `gp_num_x==2 && gp_num_y==0`. Feature, pesos globais e bias ainda vêm de entradas externas, sem modelar acesso físico ou latência. `asb3_f43.sv` é outro experimento e não foi usado. |
| Contadores virtuais do `memRead` | Reconstruídos em bloco e conectados ao wrapper funcional | `pipecnn_memread_counters.sv` reproduz as expressões de grupos x/y, `out_idx_z`, janela, `read8_flag`, `conv_z_cnt`, flag circular, coordenadas da feature, endereço global dos pesos e parada pelo `group_num_mul_win_size` fornecido. Verilator passou 20 iterações reduzidas. `derive_memread_params.py` reproduz também a derivação host-side em `main.cpp` para as 22 camadas ativas; a Layer-22 do host produz 1.392 iterações. As interfaces e latências das memórias externas continuam sem modelar. |
| Vetorização ativa `VEC_SIZE=16`, `W_VEC_SIZE=6`, `LANE_NUM=32` | Preservada no código-fonte original | A contagem física, o compartilhamento e o schedule não foram confirmados por compilação. |
| MAC original 4×(16×8), soma 26 bits e saída 32 bits | Função/contrato temporal validados isoladamente | Simulação Xcelium do wrapper original e teste do substituto passaram, mas não há integração com o núcleo. |
| MAC experimental 4×(16×16), soma/saída 32 bits | Alterado em relação ao PipeCNN original | `mac4_int16.sv` é um bloco combinacional experimental; não está no `rtl_lib.xml` e não representa o MAC 16×8 do kernel original. |
| Paralelismo aritmético ativo do `memRead` | Expresso pelo OpenCL; reconstruído em uma fatia RTL | Loops de `ll`, `m` e `n` têm `#pragma unroll`. Com 16×6×32>3036, lanes 0–30 chamam 4 MACs 4×(16×8) por posição e a lane 31 usa 16 produtos diretos: 744 blocos MAC e 3072 produtos por iteração no código-fonte. A fatia passou 24 entradas consecutivas, com latência de dois ciclos e II=1 medidos no testbench. Isso ainda não confirma schedule, mapeamento físico ou timing AOCL/ASIC. |
| Acumulação `conv_out` e conversão fixed-point | Equações fonte reconstruídas e simuladas | O módulo isolado passou as 22 tuplas de precisão de `layer_config.h`; a integração com a fatia MAC/Winograd passou três vetores nos 32 canais e seis posições. Não inclui o schedule AOCL nem os bancos de memória. |
| Protótipo de tile F(4,3) | Reconstrução aritmética local, sem equivalência ao AOCL | 9 transformadores de entrada paralelos, redução de 9 termos em 3 ciclos com 4 produtos 16×16, transformação de saída e 4 resultados horizontais; 128 tiles passaram no Verilator. Pesos de teste usam forma inteira exata `24*G*g`; não cobre quantização real, buffers ou kernel completo. |
| Geometria fonte-level de `win_buffer` | Endereço lógico reconstruído; implementação física não verificada | `numbanks(4)`, `bankwidth(64)` e a seleção circular de três slots permitem mapear 1 escrita + 2 leituras em bancos distintos sob a regra Standard Edition documentada. O módulo reconstrói a função dos slots, mas faltam relatório AOCL, latência e macros reais. |
| Bancos de `weight_buffer`/`line_buf_0` | Capacidade lógica conhecida; portas e implementação física não verificadas | Ambos declaram `numbanks(1)` sem largura/portas explícitas. `weight_buffer` tem store e load ao mesmo endereço na iteração de carga; `line_buf_0` exige leitura do valor antigo antes da escrita do máximo corrente. Forwarding, escalonamento e comportamento read-during-write dependem do AOCL. |
| Canais entre `memRead` e `memWrite` | Fronteiras e tokens fonte-level identificados; implementação temporal não verificada | `pool_ch` e `bypass_ch` levam 1536-bit tokens; o host põe as tarefas em filas distintas sem dependência por evento. Profundidade final, controle full/empty, latência e stalls requerem RTL/relatório AOCL. |
| Ordem de saída de `memWrite` | Endereço lógico e padding derivados do OpenCL/host; ciclo e interface física não verificados | A extração seleciona vetores de 16 bytes e usa os contadores `x/y/z` para calcular o endereço linear em `top`; a análise fonte-level está na seção A. Fragmentação das escritas, protocolo de memória e stalls dependem do wrapper AOCL. |
| Max-pooling | Reconstruído funcionalmente para 2×2/stride-2 | As configurações ativas host e a sequência fonte-level usam máximos horizontais em pares, um buffer de uma linha e saída em linhas alternadas. A adaptação ASIC está em `project/device/experiments/opencl_pool/`; pooling 3×3 e temporização AOCL não foram demonstrados. |
| PPAE do acelerador completo | Não medido | A adaptação Joules existente cobre somente o MAC experimental e ainda não foi executada. |

## H. Propriedades ainda não verificadas

- Hierarquia sintetizável de `memRead`, `memWrite` e dependências.
- Número físico de multiplicadores, DSPs e operadores compartilhados.
- Latência e II dos kernels, FIFOs e acesso às memórias.
- Número/forma de portas e a implementação física das memórias locais.
- Forwarding, read-during-write e ciclos do acesso simultâneo a `weight_buffer`.
- Política de inicialização e read-during-write de `line_buf_0` no pooling.
- Clock/reset/handshakes externos e ciclos de stall/backpressure.
- Equivalência funcional e temporal entre OpenCL e a implementação ASIC.
- Compatibilidade do workload específico 3×32×32 com o host/modelo original.
- Métricas ASIC PPAE.

## I. Validação isolada do MAC original

Foi possível validar a primitiva original sem compilar o kernel A10 completo.
Na Paxos, Xcelium 23.03-s003 simulou o wrapper gerado ACDS 18.0.1 com o modelo
Quartus 18.1 `altera_mult_add`. Um testbench de referência aplicou 32 vetores
signed contínuos, incluindo os extremos de 16 e 8 bits e cancelamento entre
produtos. As 39 comparações de saída bateram com a soma signed 32-bit e a saída
correspondeu aos operandos amostrados no flanco anterior, consistente com o
contrato XML de duas etapas registradas. Xcelium terminou com status 0; emitiu
avisos de caminhos obsoletos no `cds.lib` global e um aviso de estilo no modelo
Intel, sem erros de compilação ou mismatch.

Foi criado em `project/device/experiments/asic_mac4_i16_i8/` um candidato
SystemVerilog substituto, isolado do `rtl_lib.xml`. Ele mantém quatro produtos
signed 16×8, soma signed de 26 bits, extensão para 32 bits, registros de entrada
e saída, II de uma entrada por ciclo e as mesmas saídas constantes de handshake.
O testbench local comparou 32 vetores e 39 ciclos contra a mesma referência
matemática; Verilator 5.050 terminou com `PASS`. O runner reproduzível é
`project/device/experiments/asic_mac4_i16_i8/run_test.sh`.

Esta validação confirma apenas a função e o contrato temporal do MAC em nível
RTL. Ainda não comprova equivalência estrutural ciclo a ciclo contra o modelo
Intel em um único testbench, quantidade física pós-síntese, integração ao kernel
AOCL nem PPA. O candidato não foi conectado ao acelerador.

## J. Protótipo aritmético F(4,3)

Em `project/device/experiments/asic_reconstruction_f43/` foram criados RTLs
experimentais para as transformações `BT*d` e `A^T*m`, a redução de nove termos
e um tile de quatro saídas horizontais para um canal de saída. O tile contém
quatro multiplicadores 16×16 reutilizados e serializa os seis pontos Winograd;
seu testbench observou latência fixa de 31 ciclos. Verilator passou 1002 vetores
dos transformadores, 258 reduções de nove termos e 128 tiles integrados,
incluindo wrap de 16/32 bits nas transformações e wrap de 32 bits no MAC.

Essa validação demonstra a álgebra e o schedule deste protótipo dentro dos
valores testados. Não demonstra equivalência com o schedule AOCL, que continua
indisponível, nem cobre percorrer o resultado 30×30, os três canais de saída,
quantização geral, buffers, canais, pooling, interface host, integração ASIC ou
PPA. O protótipo permanece separado do RTL original e não deve ser apresentado
como réplica microarquitetural do PipeCNN.

## K. Fatia aritmética fonte-level do `memRead`

`project/device/experiments/opencl_memread_compute/` registra uma tradução
isolada dos loops ativos do caminho MAC para os parâmetros originais
`VEC_SIZE=16`, `W_VEC_SIZE=6` e `LANE_NUM=32`. O testbench Verilator passou 24
vetores consecutivos com todos os 32 canais de saída, as seis posições
Winograd, os modos `fc_en` e convolução, pesos signed 8-bit, entrada signed
8-bit e o alinhamento de dois ciclos entre os MACs e a lane 31 direta.

A expansão literal do ramo ativo contém 744 instâncias 4×(16×8) para lanes
0–30 e seis grupos de 16 produtos diretos para lane 31: 3072 produtos no
código-fonte por iteração. A fatia reproduz `BT*d`, a redução sobre os 16
termos, `A^T*m` e os dois muxes FC. O alinhamento de dois ciclos da lane direta
é implementado explicitamente para coincidir com os MACs; o schedule real do
compilador continua não verificado. O módulo combinado também acumula os termos
`conv_out`, aplica shift, `MASK9B`, bias, arredondamento, saturação signed-char
e ReLU. O testbench integrado passou três vetores; o testbench do acumulador
isolado passou todas as 22 tuplas de precisão do `layer_config.h` para os 32
canais e seis posições.

Foi preparado em
`project/device/RTL/synthesis/opencl-memread-f43-original-i8-l032/` um fluxo
isolado Genus → Xcelium → Joules para essa fatia. Ele usa o candidato de MAC
16×8, as transformações, acumulador e pós-processamento; as restrições iniciais
são clock de 2 ns no pino `clock`, atrasos de entrada/saída de 1 ns, carga de
5 fF e biblioteca TSMC28 TT a 0,90 V/25 °C. O runner cria um diretório único
por execução e recusa sobrescrita. O testbench de potência tem três casos
sintéticos. A sintaxe dos scripts, referências aos fontes e Tcl foram
verificadas localmente; ferramentas Genus, Xcelium e Joules e a biblioteca
TSMC28 foram localizadas na Paxos, mas esse fluxo ainda não foi transferido nem
executado. Portanto não há resultado de área, timing, potência ou energia.

Os blocos fonte-level de contadores, buffers lógicos, janela, fatia de cálculo,
fila local e saída `memWrite` agora estão conectados em protótipos funcionais
nas seções O e P. Essa integração não recupera a hierarquia nem o controle
AOCL: dados das memórias globais continuam externos, e bancos físicos,
latências, canais, schedule e equivalência ciclo a ciclo permanecem sem
validação.

O nome `PIPE_DEPTH` não comprova um pipeline de seis estágios: a macro está
definida no `hw_param.cl`, mas não aparece em declarações ativas do kernel; a
única outra ocorrência do identificador é um comentário sobre uma máscara. O
`#pragma ii 2` da área de carregamento também está comentado. Assim, nem a
latência completa nem o II do laço podem ser concluídos sem relatórios ou RTL
AOCL.

## L. Reconstrução funcional da saída `memWrite`

`project/device/experiments/opencl_memwrite/` contém uma adaptação SystemVerilog
da ordem de leitura de `pool_ch`/`bypass_ch`, da seleção dos 16 bytes, do
endereçamento linear e das regras de padding fonte-level. A interface ASIC
usa ready/valid e mantém um token enquanto a memória de saída aplica
backpressure; essa interface acrescenta um protocolo explícito que o fonte
OpenCL deixa para o compilador AOCL. Portanto, é uma reconstrução funcional,
não RTL recuperado nem equivalente em ciclos ao kernel original.

O teste Verilator passou 18 escritas por cada rota de canal em uma configuração
reduzida: dois grupos x, padding nos extremos, um grupo z completo, um grupo z
residual e stalls na saída. O scoreboard verifica endereço e bytes de cada
escrita. Isso cobre as condições exercitadas, mas ainda não valida todos os
parâmetros reais YOLOv2, limites de contador, integração com `memRead`, política
temporal do AOCL ou a hierarquia SYSTEM. Runner:
`project/device/experiments/opencl_memwrite/run_test.sh`.

## M. Reconstrução funcional do pooling ativo

`project/device/experiments/opencl_pool/` reconstrói o caso ativo 2×2/stride-2,
com uma linha de máximos por coluna e tokens de saída contendo dois valores por
lane. O teste Verilator executou quatro linhas e duas colunas com valores
signed, comparou quatro tokens pooled, verificou que os bytes não usados são
zero e inseriu backpressure na saída. PASS em Verilator 5.050. Essa verificação
cobre o modelo reduzido e não demonstra política física da RAM nem II do AOCL.

O wrapper `pipecnn_pool_memwrite_system.sv` conecta esse bloco ao caminho de
escrita funcional. O teste integrado verificou 16 escritas com endereços e
bytes esperados para quatro linhas de entrada, duas colunas, pooling 2×2/stride
2 e backpressure na memória de saída. Isso valida a integração entre pooling e
`memWrite` sob o protocolo ready/valid reconstruído; a entrada ainda é um token
de convolução já calculado, sem os buffers, contadores ou schedule de
`memRead`.

## N. Reconstrução funcional do buffer circular `win_buffer`

`project/device/experiments/opencl_win_buffer/pipecnn_win_buffer3.sv` modela
uma palavra de quatro vetores por índice e os três slots de `win_buffer`. A
seleção de leitura segue o `switch(flag)` ativo: `flag=0` lê 1/2, `flag=1` lê
2/0 e `flag=2` lê 0/1; cada grupo escreve no slot apontado pelo próprio flag.
O módulo não emite tiles nos primeiros `2*win_size` itens e aplica as duas
condições de borda de `conv_row_rem`.

O teste Verilator do buffer passou seis tiles após cinco grupos de
`win_size=2`, incluindo ordem dos slots, warm-up, ambas as máscaras de borda,
empacotamento por byte e backpressure. O wrapper
`pipecnn_memread_buffered_compute.sv` liga os contadores reconstruídos ao
`win_buffer`, ao `weight_buffer`, à transposição de seis vetores por posição
para layout por canal e à fatia de convolução F(4,3). O `weight_buffer`
encaminha a palavra escrita quando leitura e escrita usam o mesmo endereço no
ciclo. O teste integrado `run_compute_test.sh` passou três tiles com
`conv_loop_cnt=2`, transformação de entrada/saída, acumulação dos dois termos e
quantização fixed-point. A carga de pesos segue a condição fonte-level
`gp_num_x==2 && gp_num_y==0`; os pesos não nulos exercitados estão no canal de
entrada 0 das lanes 0 e 31, com bias zero.

O wrapper recebe do chamador as palavras de feature, pesos globais e bias para
as coordenadas/endereço que expõe; não modela acesso nem latência das memórias
externas. Os testes exercitam dois termos, não todos os valores reais de
`conv_loop_cnt`/camadas. Não prova bancos físicos, latência ou schedule AOCL,
equivalência temporal nem a execução de todas as camadas do kernel original.

## O. Reconstrução dos contadores virtuais do `memRead`

`pipecnn_memread_counters.sv` reproduz em nível de iteração as expressões ativas
dos contadores `gp_num_x`, `gp_num_y`, `out_idx_z`, `win_itm_xyz`,
`win_itm_y/z`, `flag`, `read8_flag` e `conv_z_cnt`. Também deriva as coordenadas
fonte-level da feature, a condição de carga de pesos e o endereço
`out_idx_z*win_size+win_itm_xyz`.

`run_counter_test.sh` passou 20 iterações numa configuração reduzida com quatro
grupos x, um grupo y, dois grupos de saída, `win_size=4` e dois termos de
convolução. O scoreboard confere rotação dos grupos, endereço global dos pesos,
coordenadas y/z, flag de três posições, intervalo `read8_flag` e avanço/reset de
`conv_z_cnt`. Isso valida as expressões implementadas nos casos exercitados;
não valida a interpretação de tipos/overflow AOCL nem os ciclos do hardware.

`pipecnn_memread_buffered_compute.sv` liga esses contadores ao `win_buffer`, ao
`weight_buffer`, à transposição e à fatia aritmética. O teste integrado passou
três tiles F(4,3) com dois termos acumulados, parada em doze iterações e carga
de pesos comandada pelos contadores. O chamador ainda fornece dados de feature,
peso e bias para as coordenadas/endereço expostos pelo bloco, além do total de
iterações. `derive_memread_params.py` reproduz agora a derivação host-side dos
argumentos de `memRead` para as 22 camadas ativas. Para a Layer-22 ativa,
confirmou `win_size=16`, `group_num_x=5`, `group_num_y=17` e
`group_num_mul_win_size=1392`. A derivação prepara parâmetros de workload; não
altera a interface sintetizada do top. Latência das memórias globais, leitura
física de pesos/features/bias, schedule AOCL e ciclos dos canais continuam sem
validação. Os dois testes Python verificam fórmulas e larguras para a tabela,
não a execução do host OpenCL.

## P. Reconstrução funcional integrada `memRead` → pool/bypass → `memWrite`

`pipecnn_memread_pool_memwrite_system.sv` integra os contadores e buffers do
`memRead`, a fatia aritmética F(4,3), uma fila local de resultados, a escolha
entre pooling e bypass, e a geração de endereços/dados do `memWrite`. O FIFO
tem profundidade configurável (8 por padrão) e bloqueia a admissão de novas
iterações antes de reservar quatro espaços para os resultados que ainda podem
sair dos estágios internos. Esse protocolo ready/valid é uma decisão da
reconstrução: a profundidade e a latência dos canais `pool_ch`/`bypass_ch` do
AOCL continuam desconhecidas.

`run_system_test.sh` passou nas duas rotas reduzidas: seis escritas em bypass e
duas com pooling, incluindo stall na saída, endereço estável durante stall e
FIFO vazio ao final. O mesmo testbench também usa os parâmetros host ativos da
Layer-22: envia 1.392 iterações de entrada, observa 85 tokens de resultado e
verifica uma escrita em cada endereço de 0 a 577, sem repetição nem endereço
fora do intervalo. As palavras de feature são determinísticas e não nulas, mas
peso e bias permanecem zero nesse caso. Portanto, ele verifica término, fluxo,
roteamento e endereçamento do workload host, não os valores da aritmética
combinada. Valores não nulos,
F(4,3), acumulação e quantização são testados separadamente em
`run_compute_test.sh`. Memórias globais, latência de leitura, equivalência
ciclo a ciclo ao AOCL, síntese e PPAE continuam sem validação.

## Q. Pré-flight ASIC remoto somente de leitura — 2026-10-07

Na Paxos, após carregar os módulos `genus/211`, `xcelium/2303` e `jls/16.10`,
os executáveis `genus`, `xrun` e `joules` foram localizados. O ambiente informou
Genus 21.1, Xcelium 23.03 e Joules 16.10. `TSMC28_HOME` estava indefinido, então
o fluxo usará seu caminho padrão em `/pdk/tsmc/PDK28/.../TSMCHOME`; foram
verificados nesse caminho o `.lib` TT 0,90 V/25 °C, o modelo Verilog, o
`qrcTechFile`, o LEF de células e o LEF tecnológico usados pelos scripts.
`CDS_LIC_FILE` estava definido; o checkout de licença do Genus foi confirmado
durante a execução remota. O run está em andamento, portanto a execução
completa, Xcelium e Joules ainda não estão verificados.

Depois do pré-flight, o usuário autorizou o envio do pacote de fontes à Paxos.
O checkout remoto está no baseline
`5f767b4882d039d47e0a7aeaeceb2495266b9168`, com somente
`project/device/RTL/synthesis/` e `project/device/experiments/` não rastreados.
O pacote de 65 arquivos foi arquivado fora do checkout em
`/sim/tarsio/pipecnn_opencl_experiment_stage_2026-10-07.tar.gz`; o SHA-256
remoto confere com o local:
`547dc35e71a03011ef052d6cc054dd274323c7909005be57edd50ab8845f8ace`.

## R. Execução ASIC remota da fatia `memRead` — 2026-10-07

O fluxo sintetiza apenas a fatia aritmética source-level de `memRead` com
Genus, depois Xcelium e Joules. Exclui buffers, controle, canais, pooling e
`memWrite`; o testbench de potência contém três casos aritméticos pequenos, não
um workload YOLO nem o kernel completo.

O primeiro lançamento, `memread-f43-i8-l032-20261007T-run01`, foi iniciado por
SSH com X forwarding. Após mais de três horas, o log real do Genus registrou
`X connection to localhost:10.0 broken`; o processo coordenador desapareceu,
deixando o worker Genus PID 3172248 órfão. Ele continuou ativo por mais de
quatro horas, mas desapareceu até 11:27 sem gerar o banco de saída da partição
`pbs_genopt_1`. Quarenta de 41 partições ficaram concluídas nesse run, sem
relatórios ou netlist final.

O segundo lançamento, `memread-f43-i8-l032-20261007T-run02`, foi iniciado em
background com `nohup`, sem X forwarding, e log em
`runs/memread-f43-i8-l032-20261007T-run02.launch.log`. Run02 terminou: Genus
fechou normalmente, e Xcelium passou o testbench às 17:42:56, 150 ns, gerando
`dut.vcd` (459.110.443 bytes). A etapa Joules foi iniciada, mas abortou no
checkout de `Joules_Power_SP`/`Joules_RTL_Power`; `lmstat -a` não anuncia essas
features. Portanto não há potência/energia com atividade validada. O VCD do
run02 também não serve para esse cálculo: Xcelium avisou que vetores internos
de 6.144 e 24.576 bits excederam o limite SHM de 4.096 e não foram capturados.
A inspeção do SDF mostrou 100% dos path delays anotados, mas 0% dos timing
checks, devido a um `;` após `SCOPE` que separou as demais opções em uma entrada
sem `SDF_FILE`.

Preservei o script do run02 em
`reports/paxos-run02-interim-20261007T172639/sim-run02-original.sh`. Corrigi
`sim/run.sh` para manter as opções SDF na mesma entrada e definir
`SHM_PACKED_LIMIT=24576`. Iniciei `memread-f43-i8-l032-20261007T-run03-sdf-fixed`
reutilizando os artefatos lógicos do run02 por symlink; este run separado
refaz somente Xcelium, sem repetir Genus. Às 17:47:13, `xmelab` ainda estava
elaborando o design, mas já reportava `MTM control: TYPICAL`, fatores `1:1:1`
e `Annotation completed successfully`; o aviso `FLFNOF` do run02 não reapareceu.
A primeira etapa `PBS_Generic-
Post_Genopt` terminou após cerca de 4h32 de parede e devolveu todas as 41
partições, inclusive a partição 1. Em seguida o Genus iniciou nova otimização
genérica particionada sobre 3.591.164 instâncias. Às 14:59, o Genus terminou
de criar os netlists de partição e iniciou o orçamento de timing; às 15:01
começou a etapa `pbs_fcopt`, e às 15:31 todas as 39 partições não vazias
haviam retornado com seus bancos pós-processados.
Às 15:34 o log registrou `Done synthesizing ... to generic gates`; às 15:37
registrou `@file(logical_synthesis.tcl) 38: syn_map` e iniciou o mapeamento
particionado de 2.248.840 instâncias em 23 partições. Às 17:02:34, todos os 22
jobs `pbs_map` haviam retornado e o pós-processamento de mapa estava completo.
Depois do mapeamento global, o Genus concluiu operações de pós-mapa e registrou
`Done mapping` às 17:11:35; às 17:12:41 iniciou `syn_opt`, entrou em
`PBS_Incr_Opt-Uniquify_Netlist` e particionou o design para análise de timing.
Às 17:17:27, as 15 partições `pbs_iopt` haviam sido criadas e distribuídas aos
servidores Genus locais para otimização; às 17:20:48, onze bancos `_post.db`
existiam e 13 dos 15 jobs haviam sido recebidos pelo coordenador. Às 17:21:51,
os 15 jobs já tinham retornado e a pasta temporária de partições foi removida;
o Genus iniciou `1ST_ST` e o log mostrava uma métrica interna intermediária
com área 1.673.552 e TNS 0; a unidade/semântica dessa tabela de otimização não é
tomada como resultado final. Às 17:24:40, o log registrou `Done incrementally
optimizing`. Às 17:26:39, estavam presentes os relatórios de área, portas e
timing. A área reporta 1.012.630 células, `Cell Area` 1.191.178,926 e
`Total Area` 1.678.994,118 (unidade não explicitada nessa tabela). O relatório
de timing contém um caminho de setup: `MET (0 ps)`, com clock de 2 ns e required
time 1.986 ps. Isso indica que o caminho listado fecha exatamente no limite,
sem margem reportada; a listagem contém apenas um caminho. Os três relatórios
interim foram copiados para `reports/paxos-run02-interim-20261007T172639/`, e
os SHA-256 locais conferem com os arquivos na Paxos. A interpretação
física deve considerar os avisos de células ausentes na biblioteca timing/QRC
abaixo. O Genus executou `report_power -unit mW` (engine Joules): essa é a
estimativa vetorial sem atividade, não a análise standalone com VCD. O relatório
vetorial soma 2.052,00 mW, mas ignora atividade real e avisa que `-stim` e
frequency scaling não se aplicam ao modo vectorless. Às 17:27:54, terminou com
`PWRA-0007 Completed successfully` (2 warnings, 0 errors, 0 fatals). O netlist
mapeado (229.871.460 bytes) estava escrito e foi copiado para a pasta interim;
seu SHA-256 local confere com o remoto. Às 17:39:10, o SDF fechou com
861.342.225 bytes e foi copiado para o notebook com SHA-256 conferido. Xcelium
reportava zero erros de compilação/elaboração até o momento e 15 avisos de
caminhos ausentes no `cds.lib` global, ignorados pelo próprio Xcelium. O banco
Genus fechou com 27.680.592 bytes. As partições concluídas reportaram Slack entre
0,0 e -0,4 (TNS entre 0,0 e 2,5), em relatórios individuais, ainda sujeitos ao
relatório agregado. O resumo interno do mapper indicou Slack -168 para o
grupo `clk`, com constraint 2000, na partição `pbs_map_1`; é resultado de
partição/mapeador, não o relatório agregado final. O log também reportou WNS
interno -34,1 numa etapa local de otimização, sem unidade confirmada aqui.
Ambos os valores são diagnósticos intermediários e não substituem o relatório
agregado de timing. O Genus encerrou com `Normal exit`.
Houve um aviso
`CPI-506` de ausência de power intent durante a síntese; ainda não há evidência
de que tenha sido fatal. Também apareceram avisos `PHYS-279` para células
presentes na LEF física, mas ausentes na biblioteca timing, e `PHYS-12` sobre
faixa de parâmetros de camadas QRC; a síntese continua, mas esses avisos devem
ser considerados ao interpretar timing/área física. Xcelium reportou 15 caminhos
antigos no `cds.lib` ignorados no run02; a simulação passou funcionalmente apesar
dos avisos de anotação/captura descritos acima. Joules standalone não passou da
etapa de licença. O worker órfão do run 01 já não estava ativo. Relatórios,
netlist e SDF foram copiados e hash-verificados; ainda falta copiar o banco
Genus, VCD/SHM e logs, e concluir a repetição Xcelium do run03. Uma tentativa
Joules com atividade só será possível quando as licenças estiverem disponíveis.
**Atualização posterior — 2026-10-07, 17:50–17:55:** o texto interim acima
precede o encerramento do run02 e a conclusão do run03. Os fontes RTL usados
pela fatia (`pipecnn_memread_conv_slice.sv`, `pipecnn_memread_compute.sv`,
`pipecnn_conv_accumulator_postprocess.sv`) e o testbench já estão no checkout
local em `project/device/experiments/opencl_memread_compute/`; seus SHA-256
foram comparados com a cópia da Paxos. O netlist mapeado e o SDF do run02
também já estão locais em `reports/paxos-run02-interim-20261007T172639/`, com
hashes conferidos.

O run03 corrigiu a sintaxe do comando SDF e terminou em `PASS` aos 150 ns.
Seu VCD de 424 MiB, `xrun.log` e `sdf.log` foram copiados e verificados por
SHA-256 em `reports/paxos-run03-sdf-fixed-20261007/sim/`. O log confirma
MTM `TYPICAL`, escala `1:1:1` e `FROM_MAXIMUM`, mas somente 174.844 de 525.428
timing checks (33,28%) foram anotados. Permanecem avisos `PRPASZ` para arrays
packed largos não sondados; a cobertura dos sinais no VCD ainda precisa ser
validada antes de usá-lo para potência baseada em atividade.

Assim, os RTL de entrada **da fatia reconstruída do run02** e o netlist dessa
mesma fatia estão no notebook, nos caminhos acima. Isso não significa que o RTL
original completo gerado pelo AOCL esteja local: a hierarquia original de
`memRead`/`memWrite` continua ausente. O que foi trazido da Paxos nessa
atualização são os artefatos da simulação run03. Os arquivos remotos originais
e os runs completos continuam preservados sob
`/sim/tarsio/PipeCNN_Winograd/...`.
Joules standalone continua pendente da licença `Joules_Power_SP` ou
`Joules_RTL_Power`, que não foi anunciada pelo servidor na tentativa run02.

**Atualização run05 — 2026-10-07, 18:00–18:05:** a inspeção do VCD run03
mostrou que ele omitia completamente o porto `transformed_weights` de 24.576
bits. O run04 tentou aumentar o limite por opção de `probe`, mas repetiu os
system tasks de dump e não corrigiu a captura. No run05, a variável Tcl
`probe_packed_limit` foi definida antes de criar o probe. O novo Xcelium VCD
agora declara todos os bits de `tb_memread_conv_slice.dut.transformed_weights`
(índices 0–24575); a leitura integral confirmou transições em todos os bits
(73.446 mudanças escalares). O teste funcional terminou `PASS` aos 150 ns, sem
avisos `LMTMSG`/`PRPASZ`. Os arquivos foram copiados para
`reports/paxos-run05-vcd-probe-fixed-20261007/sim/` e seus SHA-256 conferem com
a Paxos. O run05 ainda emite `DFUSE` porque `$dumpfile` tentou abrir novamente
o VCD já criado pelo Tcl; isso não retirou as declarações nem as mudanças dos
24.576 bits verificadas no artefato final.

O SDF run05 anotou 100% dos path delays, 99,74% dos `$setuphold` e 0% dos
`$width`; a cobertura total segue 33,28% dos timing checks. O VCD tem atividade
completa dos pesos. Uma nova consulta `lmstat -f Joules_RTL_Power` e `lmstat -f
Joules_Power_SP` às 17:54 confirmou que o daemon está ativo, mas nenhuma das
duas features standalone está disponível.

**Atualização — estimativa de potência Genus com VCD:** Genus 21.12 leu o banco
lógico do run02 e o VCD do run05, com escopo
`tb_memread_conv_slice/dut`. O parser Joules integrado ao Genus propagou a
atividade e `report_power` terminou com `PWRA-0007` (0 erros/fatais). O relatório
local está em `reports/paxos-run05-vcd-probe-fixed-20261007/power_genus/`; os
SHA-256 de `power_evaluation.txt`, `genus.log`, `genus_console.log` e
`genus.cmd` estão registrados no manifesto do run05. A potência média reportada
é 147,830 mW: 5,692 mW leakage, 57,067 mW internal e 85,072 mW switching. Para
a janela VCD de 150 ns, `P_média × janela = 22,1745 nJ`; isso é energia derivada
da média no testbench, não energia por operação. A anotação lista 100% das
entradas, saídas e saídas de flip-flop; 478 de 1.284.005 driver nets aparecem
desconectados. A categoria clock reporta 0 mW, sem árvore CTS física. O log
confirma o uso do motor Joules dentro do Genus, sob licença Genus; o executável
Joules standalone permanece indisponível pelas licenças ausentes.

O resultado limita-se à fatia aritmética reconstruída e aos três vetores curtos
do testbench em 0–150 ns, incluindo reset/ociosidade. Não é uma estimativa de
camada YOLOv2 nem da hierarquia AOCL completa. Permanecem avisos LBR/PHYS e a
cobertura SDF de 33,28% dos timing checks (0% dos checks `$width`); portanto,
esse resultado não valida PPAE arquitetural.

## Marco

**M1 — auditoria estática:** fontes, parâmetros, caminho de dados e dependência
MAC classificados; interfaces OpenCL e divergência do workload do host também
registradas. A tabela de dependências cobre as evidências do código-fonte e do
IP existente; faltam dependências descobertas somente no RTL gerado, larguras e
ciclos de cada estágio e resolução das propriedades do compilador.

**M2 — reprodução Intel:** ainda não concluída. AOCL 18.1 Standard está
instalado na Paxos, mas a tentativa Arria 10 foi recusada antes de compilar por
falta do Quartus Pro. Foram verificados os módulos/setup 18.0/19.1, artefatos
em `/sim/tarsio`, no home remoto e as árvores, branches e tags dos nove forks
públicos; esses locais não forneceram instalação compatível ou RTL/netlist do
kernel. Não há `.aocr`, `.aocx` ou HDL/netlist AOCL do kernel `conv_pipe` nos
locais pesquisados; os wrappers e modelos do IP MAC permanecem disponíveis.

**M3 — recuperação do RTL original:** não concluída. A hierarquia completa de
`memRead`/`memWrite` continua indisponível. As RTLs em
`project/device/experiments/opencl_memread_compute/` são uma reconstrução
source-level da fatia aritmética, não saída recuperada do compilador Intel.

**M4 — primitivas ASIC:** a substituição isolada do MAC foi validada contra a
especificação/modelo disponível, mas a latência original ainda não foi
confirmada por simulação da hierarquia Intel.

**M5 — núcleo funcional:** os testes source-level e a simulação gate-level da
fatia terminam `PASS`. Isso não prova equivalência temporal à schedule AOCL.

**M6 — PPA inicial:** Genus concluiu mapeamento, reports de área/timing,
netlist e uma estimativa de potência com atividade do VCD para a fatia
source-level. O relatório de setup lista um caminho em `MET (0 ps)`, sem
margem; avisos PHYS/QRC permanecem. A estimativa de potência é restrita aos
três vetores curtos; Joules standalone não executou porque as duas features de
licença exigidas estão ausentes.

**M7 — PPA validado:** não concluído. Embora exista uma estimativa Genus baseada
na atividade do VCD, faltam workload representativo, integração/síntese da
fronteira de sistema e validação temporal AOCL/equivalência arquitetural. A
fronteira ASIC sintetizada continua limitada à fatia aritmética, sem buffers,
controle, canais, pooling ou `memWrite`.

**Validação da primitiva MAC:** concluída isoladamente contra o modelo Intel e
contra o candidato ASIC; a integração continua bloqueada pela ausência do RTL
completo do kernel.

O caminho funcional source-level de `memRead` até `memWrite` agora está ligado
sob o protocolo explícito da reconstrução, além dos testes de cada bloco. Os
próximos itens são modelar as memórias globais com latência configurável e
workloads host realistas, reforçar a comparação funcional com referências
independentes, e preparar a síntese do sistema reconstruído sem atribuir a ele
equivalência ao schedule AOCL. A recuperação M2 continua aberta: somente uma
instalação AOCL/Quartus Pro compatível com Arria 10 ou os artefatos do build
original podem confirmar hierarquia, latências, II, bancos e temporização AOCL.

## S. Síntese ASIC da reconstrução de sistema — em andamento

Para avançar a alternativa 3 do `opencl.md` sem misturar o resultado com RTL
Intel, foi criado o fluxo
`project/device/RTL/synthesis/opencl-system-f43-i8-l032/`, com top
`pipecnn_memread_pool_memwrite_system`. Ele inclui os contadores, buffers e
compute reconstruídos de `memRead`, o FIFO explícito, pooling/bypass e a saída
de `memWrite`. Os dados de feature, peso e bias permanecem como portas externas;
não há macros nem latência de RAM. O FIFO usa ready/valid definido pela
reconstrução. Portanto, a síntese não representa a hierarquia nem o timing AOCL.

A lista de 15 fontes RTL foi comparada com a Paxos por SHA-256 e todos os hashes
coincidiram. A elaboração local de Verilator 5.050 com essa lista terminou sem
erro. O fluxo preserva o alvo inicial TSMC28 TT, 0,90 V/25 °C e clock de 2 ns;
`reports_power` vectorless, caso gerado, será apenas diagnóstico. Não há
testbench/VCD representativo associado a esta síntese.

O run `system-f43-i8-l032-20261007T182100` foi iniciado em 2026-10-07 às 18:24
BRT na Paxos, com Genus 21.12 e licença `Genus_Synthesis`. O Genus concluiu a
elaboração do top e iniciou tarefas internas de otimização; avisou que os
blocos `initial` de verificação são ignorados e removeu o registrador não
utilizado `unused_scal_rem_z` de `memWrite`. Na última consulta, às 19:38 BRT,
os processos principal/filho ainda existiam, mas estavam esperando em IPC; seus
contadores de CPU quase não mudaram nas amostras curtas recentes. O log
`runs/system-f43-i8-l032-20261007T182100/logical/genus.log` tem 20.220 bytes,
parado após os truques de otimização pós-elaboração, e ainda não há relatórios
nem netlist. O job não foi encerrado nem relançado; revalidar o mesmo run antes
de qualquer decisão. M6 para o sistema reconstruído ainda não foi atingido.

## R. Revalidação de acesso e artefatos Intel na Paxos — 2026-10-07, 18:20 BRT

O acesso SSH somente de leitura foi restabelecido fora do sandbox. O checkout
remoto continua no mesmo commit `5f767b4` do notebook. A lista atual de módulos
Quartus, consultada com `module use /soft64/modulefiles/altera/quartus`, contém
11.1, 12.0, 12.0-SP2 e 18.1; não apareceu Quartus Prime Pro. O módulo 18.1
configura somente o Quartus Standard e não põe `aoc` no `PATH`. O executável foi
localizado em
`/soft64/altera/ferramentas/quartus/18.1/hld/bin/aoc`; sua consulta `-version`
retornou Intel FPGA SDK for OpenCL 18.1.0 Build 625 Standard Edition. Essa
consulta não compilou o kernel.

Uma busca atual em `/sim/tarsio` não encontrou `.aocr`, `.aocx`,
`conv_pipe*.aoco`, `conv_pipe*.v`, `conv_pipe*.sv`, `.qpf` ou `.qsf`. No checkout
remoto há `rtl_lib.aoco`, os wrappers/modelos do IP MAC, as reconstruções
source-level e o netlist mapeado da fatia `pipecnn_memread_conv_slice`; nenhum
deles é a hierarquia AOCL completa de `memRead`/`memWrite`. No notebook também
não há `aoc`, Quartus, Genus ou Xcelium no `PATH`.

Assim, a revalidação confirma o bloqueio M2/M3, sem evidência de RTL original
novo. O caminho de síntese já executado permanece uma avaliação ASIC da fatia
reconstruída. A alternativa 3 do `opencl.md` pode avançar separadamente, desde
que toda nova síntese seja marcada como reconstrução source-level e não como
resultado da arquitetura Intel recuperada.

## T. Rechecagem do run de sistema na Paxos — 2026-10-07, 19:42 BRT

O mesmo run `system-f43-i8-l032-20261007T182100` continua ativo na Paxos. Às
19:42, `genus` (PID 3507722) e o subprocesso interno (PID 3510874) ainda
existiam. Em uma amostra de 20 segundos, o tempo de CPU aumentou cerca de um
segundo em cada processo; portanto, há atividade intermitente, mas não evidência
de progresso suficiente para estimar conclusão. O `genus.log` segue em 20.220
bytes desde 18:29 e a pasta do run ainda contém apenas esse log, sem netlist ou
relatórios. O arquivo interno `MESG` mais recente permaneceu com 89.486 bytes e
timestamp 19:38 durante a amostra. `lmstat` confirmou o servidor de licenças
ativo; a consulta específica `Genus_Synthesis` não retornou uso do recurso, o
que não identifica a causa da espera. Nenhuma ação de reinício ou interrupção
foi tomada.

Na rechecagem de 21:16 BRT, o mesmo processo permanecia vivo havia 2h52, com
1h05 de CPU no processo principal e 30 min no subprocesso Genus. A pasta ainda
continha somente o `genus.log` de 20.220 bytes, sem relatório ou netlist. O
consumo acumulado confirma alguma atividade desde o início, mas o longo período
sem avanço observável no log/artefatos impede estimar progresso ou conclusão.

## U. Busca ampliada por artefatos AOCL no home da Paxos — 2026-10-07, 19:43 BRT

O home efetivo da conta remota é `/home/tarsio.onofrio` (não
`/home/tarsio`). Uma busca somente leitura até profundidade 8 nesse home por
`.aocr`, `.aocx`, `.aoco`, `conv_pipe*.v/.sv`, `.qpf` e `.qsf` não encontrou
artefatos. A busca anterior em `/sim/tarsio` encontrou somente
`project/device/RTL/rtl_lib.aoco`, que é a biblioteca do IP já conhecido, não
uma compilação do kernel `conv_pipe`. Essa extensão de busca não recuperou RTL
AOCL original; M2/M3 continuam sem o artefato de maior fidelidade necessário.

## V. Diagnóstico interno do Genus — 2026-10-07, 21:17–21:20 BRT

O arquivo temporário `MESG` do subprocesso Genus tinha 90.451 bytes e
timestamp 21:05. Sua cauda textual contém mensagens de `ACTP`/`PWRA` para
objetos internos `pbs_genopt_*`; a busca encontrou 47 nomes distintos (0 a 46)
e 85 mensagens `PWRA-0007 Completed successfully`, sem contadores de erro ou
fatal. Esses eventos são avaliações vectorless internas, acompanhadas dos
avisos de que frequency scaling/stim não se aplicam ao modo vectorless; não são
os relatórios finais do fluxo nem medição representativa. Na amostra curta de
21:18, cada processo Genus acumulou cerca de um segundo de CPU em 20 segundos,
sem alteração do `MESG`. Às 21:20, a pasta do run ainda tinha somente o
`genus.log` de 20.220 bytes, sem netlist e relatórios. O processo permanece
vivo, mas não há evidência de avanço recente após essas mensagens internas.
O `genus.log` e o snapshot `MESG` foram copiados para
`reports/paxos-run-system-f43-i8-l032-20261007T182100/diagnostics/`; ambos os
SHA-256 locais conferem com os arquivos remotos, conforme o manifesto dessa
pasta.

## W. Revalidação integrada e estado remoto — 2026-10-07, 21:28 BRT

Uma reinspeção encontrou que o bloco `initial` já zera todos os bits de
`weight_word` com um loop; a hipótese inicial de entrada indeterminada estava
errada. Uma atribuição declarativa redundante com `='0` disparou `WIDTHCONCAT`;
com cast `WEIGHT_W'(0)`, o runner repetido passou, mas a declaração extra foi
removida. O testbench final voltou à forma original, que já tinha um `PASS`
registrado na campanha inicial. O caso Layer-22 continua usando palavras zero e
valida controle/roteamento/endereço, não sua aritmética não nula.

Na mesma checagem, o run Genus remoto ainda estava ativo após 3h03. O processo
principal acumulava 1h06 de CPU e 19,2 GiB de RSS; o processo filho acumulava
30m38s de CPU. A pasta lógica remota ainda continha somente o `genus.log` de
20.220 bytes (inalterado desde 18:29), e o `MESG` temporário permanecia com
90.451 bytes/timestamp 21:05. Sem novo netlist/relatório e sem alteração desses
logs, não há evidência de progresso recente que permita prever conclusão.

## X. Amostra adicional do run Genus — 2026-10-07, 21:35–21:37 BRT

O run `system-f43-i8-l032-20261007T182100` segue ativo na Paxos. Às 21:37,
`run.sh` (PID 3507689), o Genus principal (PID 3507722) e o subprocesso
Genus (PID 3510874) estavam presentes. Um worker descendente (PID 3514857)
apareceu em estado executável (`R`) nas duas amostras separadas por cerca de
44 segundos; seu tempo de CPU avançou de aproximadamente 2h29m09s para
2h29m53s. Isso confirma trabalho de CPU no run, embora não permita estimar a
conclusão. O log continua em 20.220 bytes, com mtime 18:29:39, e o diretório
lógico ainda contém apenas `genus.log`: não há netlist nem relatório final.
O run não foi interrompido nem reiniciado.

## Y. Testes de stalls e compute não nulo no sistema — 2026-10-07, 21:39–21:50 BRT

O testbench integrado passou a atrasar cada resposta sintética de
`bottom_word` por 2–4 ciclos antes de afirmar `word_valid`. O padrão de dados
é determinístico em função de `bottom_read_address`, respeita
`bottom_zero_fill`, e o testbench verifica que o endereço não muda enquanto a
resposta está pendente ou aguardando `word_ready`. O comando
`project/device/experiments/opencl_win_buffer/run_system_test.sh` terminou com
exit code 0 no Verilator 5.050: 1.428 respostas, 4.282 ciclos totais de espera
e máximo de quatro ciclos. O workload de parâmetros da Layer-22 preservou
1.392 iterações, 85 tokens e 578 escritas únicas. Foi acrescentado também um
caso reduzido não nulo F(4,3), com 12 palavras de feature e duas acumulações;
uma referência inteira independente comparou os três tokens de compute e os
seis vetores escritos por `memWrite` após FIFO, stalling e backpressure.

Este teste exercita stalls do produtor na fronteira reconstruída
`word_valid/data`; não representa uma interface de requisição/resposta de RAM
recuperada do AOCL. Pesos e biases da Layer-22 continuam zerados, então os
valores não nulos de feature não validam aritmética nesse workload; a aritmética
não nula está coberta pelo caso reduzido separado. Os casos reforçam a validação
funcional e temporal da reconstrução,
mas não provam latência, throughput ou equivalência ciclo a ciclo do hardware
Intel original. A descrição foi atualizada em
`project/device/experiments/opencl_win_buffer/README.md`.

## Z. Estado remoto da síntese do sistema — 2026-10-07, 21:47 BRT

O run `system-f43-i8-l032-20261007T182100` permanece ativo após 3h22 na
Paxos. O processo Genus principal (PID 3507722) tem 19,2 GiB de RSS; o worker
3514857 estava em estado `R`, com 99,8% de CPU média e 2h39m46s de CPU
acumulada. O worker continua consumindo CPU, mas essa atividade não identifica
qual estágio interno está executando. O diretório lógico ainda contém apenas
`genus.log` (20.220 bytes, mtime 18:29:39), sem netlist ou relatório. O run
segue sem interrupção ou reinício e não há base para estimar conclusão.
O `MESG` interno continua em 90.451 bytes, mtime 21:05:32, com SHA-256
`838063459e50fff04a8edd45549113b4c833a5ad774e464dd2ae74fd50549d8a`, igual ao
snapshot local já preservado. Não há mensagens internas novas desde aquela
captura.

## AA. Inspeção integral do diretório do run — 2026-10-07, 21:51 BRT

A árvore inteira até profundidade seis de
`runs/system-f43-i8-l032-20261007T182100` contém apenas os diretórios do run,
`logical/` e o `logical/genus.log` de 20.220 bytes, sem netlists, bancos ou
relatórios em outros subdiretórios. O mesmo run permanece ativo: PID 3507722
acumulava 1h07m08s de CPU e o worker PID 3514857, em estado `R`, 2h44m06s.
O worker acumulou cerca de 3m50s de CPU desde a amostra de 21:47, mas o log e
a árvore de saída não avançaram. Isso confirma atividade de processamento sem
identificar o estágio interno nem oferecer estimativa de término.

## AB. Diagnóstico de recursos do host durante Genus — 2026-10-07, 21:52 BRT

Uma amostra de `vmstat 1 5` durante o run mostrou 38 GiB de memória disponível,
3,6 GiB de swap já ocupada, mas zero swap-in/swap-out nos cinco intervalos e
sem espera relevante de I/O de disco. O uso agregado de CPU do host ficou em
aproximadamente 32%, enquanto o worker Genus PID 3514857 consumia um núcleo
(99,8% em `ps`); a máquina não estava globalmente saturada. O principal Genus
mantinha cerca de 19,2 GiB de RSS. Esses dados apontam para trabalho de CPU no
worker, sem sinal observado de pressão imediata de memória ou I/O como causa da
demora. É uma amostra curta, não uma identificação do algoritmo interno que
continua executando.

## AC. Partição interna Genus ainda em processamento — 2026-10-07, 21:53 BRT

Na pasta interna `.pbs_paxos.inf.pucrs.br_3507722` há 47 arquivos
`pbs_genopt_*.etf` e 46 bancos `pbs_genopt_*_post.db`; falta somente
`pbs_genopt_7_post.db`. O worker Genus PID 3514857 mantém aberto o arquivo
`pbs_genopt_7.etf` (1.523 bytes, mtime 18:59:25); o banco-base
`pbs_genopt_7.db` tem 20.560.655 bytes e mtime 19:00:47. O worker estava em
estado `R` e consumiu mais 20 segundos de CPU durante a amostra, mas o banco
`_post.db` da partição 7 não surgiu. O maior banco pós-partição observado,
`pbs_genopt_5_post.db`, tem 99.356.091 bytes e mtime 21:10:19. Isso indica que
o run avançou por bancos internos depois de o log principal parar, e localiza
o único banco de saída de partição ainda ausente. O motivo e o tempo restante
continuam desconhecidos.

## AD. Revalidação local e perda temporária de acesso à Paxos — 2026-10-07, 22:00 BRT

Uma nova consulta SSH a `paxos.inf.pucrs.br:8888` falhou antes da autenticação
com `Temporary failure in name resolution`. O resolvedor local aponta para
`100.100.100.100`, mas o comando `tailscale status` não conseguiu conectar ao
daemon local. Não foi executado comando privilegiado para iniciar ou alterar o
serviço. Portanto, não há evidência atual de que o Genus terminou, falhou ou
continua ativo; o último estado remoto verificável permanece o da seção AC.

Enquanto o acesso remoto estava indisponível, os 14 runners de simulação
existentes em `project/device/experiments/**/run*.sh` foram executados
localmente e terminaram com exit code 0 no Verilator 5.050. Isso inclui as
verificações do MAC (39 checks, 32 vetores, latência de dois estágios),
transformações F(4,3), core/tile, acumulação e pós-processamento, contadores,
buffers de janela, pooling, `memWrite` e o caminho integrado
`memRead`→FIFO→pool/bypass→`memWrite`. O teste integrado cobriu 1.392 iterações
da configuração host Layer-22, 85 tokens, 578 endereços de saída e um caso
reduzido F(4,3) com dados não nulos e referência inteira. Os dois testes Python
de derivação dos parâmetros host também passaram. Os runners usaram diretórios
temporários em `/tmp`, removidos ao fim.

Essas simulações validam os módulos reconstruídos sob seus próprios
testbenches; não provam equivalência ciclo a ciclo com o RTL AOCL, nem
constituem a validação do netlist Genus ou evidência de potência. M2/M3 e M7
continuam incompletos.

## AE. Assertion temporal e latência configurável da reconstrução — 2026-10-07, 22:10 BRT

O teste `opencl_memread_compute` agora confirma 24 entradas aceitas em ciclos
consecutivos, latência de dois ciclos e II de saída igual a um. Essa assertion
revelou e levou à correção de um erro no sequenciamento anterior do testbench,
que mantinha `ivalid` alto por dois ciclos por vetor. `run_test.sh` recompilou e
passou após a correção.

O produtor de feature do teste integrado agora aceita `+MEMORY_READ_LATENCY` e
`run_system_test.sh` executa quatro cenários: atraso padrão variável de 2–4
ciclos e atrasos fixos de 0, 1 e 4. Todos passaram mantendo 1.392 iterações
Layer-22, 85 tokens, 578 endereços de saída e o caso reduzido não nulo F(4,3).
Os ciclos de espera modelados foram 4.282 no modo padrão e 0, 1.428 e 5.712 nos
modos fixos. Do reset à drenagem de saída/FIFO, o contador do testbench observou
6.965 ciclos no modo padrão e 2.791, 4.184 e 8.360 ciclos nos modos fixos 0/1/4.
As contagens incluem o controle reconstruído e backpressure programado; não
representam latência ou throughput AOCL.

Uma nova consulta SSH continuou falhando com `Temporary failure in name
resolution`, portanto o estado atual do Genus na Paxos ainda não pôde ser
determinado. O último estado remoto direto continua sendo o registrado na
seção AC.

## AF. Identificação do workload da configuração host — 2026-10-07

A expressão `--layer 22` em `derive_memread_params.py` seleciona a 22ª linha
ativa de `layer_config.h`, não resolve por si só o nome da camada no modelo.
Essa linha tem entrada 17×17×256, filtro 1×1, 256 canais de peso e 32 saídas;
seu comentário no array diz `Layer-23`. Já `output_config` e o último
comentário de `precision_config` dizem `Layer-22`, ambos compatíveis com a
dimensão 17×17×32. A camada/modelo pretendido não foi reconciliado com uma
execução do host ou com o modelo Caffe.

Para evitar atribuir uma identidade que os comentários contradizem, o
testbench integrado e sua documentação agora chamam o caso de “linha ativa 22
da configuração host”. A derivação continua produzindo 1.392 iterações, 85
tokens e 578 endereços. `run_system_test.sh` foi reexecutado após a alteração
de nomenclatura e passou nos quatro cenários de latência (variável 2–4 e fixa
0/1/4). Essa correção de rótulo não altera o RTL nem elimina as limitações de
equivalência AOCL registradas acima.

## AG. Interrupção do run de síntese do sistema — 2026-10-07, 22:29 BRT

Após o usuário pedir a interrupção, o SSH direto à Paxos foi restabelecido sem
Tailscale usando `ssh -F /dev/null -XC -p 8888 -i ~/.ssh/gaph`. O processo
Genus principal PID 3507722 tinha CWD
`/sim/tarsio/PipeCNN_Winograd/project/device/RTL/synthesis/opencl-system-f43-i8-l032/logical`;
seu launcher era o `run.sh` desse fluxo. A árvore e os PIDs foram conferidos,
e o PGID 3507685 continha somente esse launcher, esse Genus e seus descendentes.

Foi enviado `SIGTERM` ao PGID 3507685. Cinco segundos depois, o grupo estava
vazio; uma consulta posterior confirmou ausentes os PIDs 3507685, 3507689,
3507722, 3510872, 3510874 e 3514857. O run ficou ativo por aproximadamente
4h05. Nenhum processo de outros runs Genus foi sinalizado.

Os logs finais foram copiados para
`reports/paxos-run-system-f43-i8-l032-20261007T182100/diagnostics/` e seus
SHA-256 foram comparados novamente com os arquivos remotos. O log do run tem
20.220 bytes e permanece inalterado desde 18:29; o log interno do diretório de
trabalho tem 65.402 bytes e mtime 21:11:35. Ele termina em otimizações
pós-elaboração e nenhum dos logs contém `Normal exit`. A árvore `runs/` contém
somente o `genus.log`, sem netlist nem relatórios finais. Os arquivos
temporários internos foram preservados no remoto. Portanto, essa síntese foi
interrompida antes de concluir e não fornece resultado de área, timing ou
potência do sistema.

## AH. Primeiro teste com HLS alternativo Bambu — 2026-10-07

Foi testado o Bambu/PandA 2024.10 na Paxos, usando a AppImage oficial em
`/sim/tarsio/bambu-2024.10.AppImage` (SHA-256
`e4f0214496a5d35de1932975b0f41cd95bc33a53a904fc565d6c2cb01df40773`). A
primeira configuração, com opções explícitas de interface/reset e nome de RTL,
terminou em `Segmentation fault` após a análise do MAC. Uma soma simples, uma
multiplicação 16×8 e dois produtos acumulados passaram; com opções mínimas, o
MAC de quatro produtos também passou pelo HLS.

A entrada C `project/device/experiments/opencl_hls_bambu/mac4_i16_i8.c` modela
somente a operação usada em `memRead` (`conv_pipe.cl`, chamada ao MAC em torno
das linhas 724–740): quatro produtos signed 16×8 e soma signed de 32 bits. O
RTL Bambu padrão está no diretório do experimento; a variante Nangate45 está
em `project/device/experiments/opencl_hls_bambu/nangate45/`. As duas foram
simuladas no Verilator 5.050 contra 36 vetores dirigidos/aleatórios e passaram.

No relatório do Bambu, a configuração padrão estima dois ciclos, 73
flip-flops, quatro DSPs e frequência máxima de 127,25 MHz. A configuração
`nangate45` a 10 ns estima um ciclo, zero flip-flops, zero DSPs, 13.399
unidades de área do modelo e 231,20 MHz. O testbench observou `done_port` após
uma borda nas duas variantes, divergindo da contagem de dois ciclos no log
padrão. Essa diferença de convenção/schedule ainda precisa ser explicada. As
áreas e frequências são estimativas Bambu; não houve síntese Genus, mapeamento
físico, análise de potência ou comparação PPA.

Este é um teste de viabilidade de HLS para uma operação C extraída do código,
não uma compilação direta do `conv_pipe.cl` nem geração do RTL completo do
acelerador. O kernel mantém canais Intel, buffers locais e controle que este
experimento não representa. Os fontes, RTL, logs e testbench estão em
`project/device/experiments/opencl_hls_bambu/`; a simulação pode ser repetida
com `run_verilator.sh` nesse diretório.
