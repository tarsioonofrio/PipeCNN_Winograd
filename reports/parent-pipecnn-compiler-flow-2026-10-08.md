# Investigação do projeto pai PipeCNN

Data: 2026-10-08
Checkout inspecionado: `/home/tarsio/gaph/PipeCNN`
Revisão: `392692b` (`2022-02-15`, `update google drive`)
Estado Git observado: limpo (`master...origin/master`).

Esta foi uma inspeção somente de leitura. Não foram executados builds do
projeto pai nem alterados arquivos nele.

## O que o projeto pai documenta sobre AOCL

O README do pai lista Intel OpenCL SDK **Pro 20.1** e placas Arria 10 entre as
plataformas testadas (`/home/tarsio/gaph/PipeCNN/README.md`, linhas 21–35).
No projeto Intel, o Makefile deixa explícita a diferença entre os fluxos:

- `FLOW=report`: `aoc -v -c -report`, descrito como geração de `.aoco` para a
  edição Standard;
- `FLOW=rtl`: `aoc -v -rtl -report -fmax=300`, descrito como geração de `.aocr`
  para a edição Pro.

O Makefile deixa `FLOW=rtl` como padrão e aponta o BSP padrão para
`C:\intelFPGA_pro\19.3\hld\board\a10_ref`, com alternativas Linux Pro 19.1 e
19.3 comentadas (`project_intel/Makefile`, linhas 8–13 e 23–33, 135–139).
Isso confirma que a tentativa `-rtl` em Quartus/AOCL Standard não corresponde
ao fluxo de ferramenta documentado pelo projeto pai. Também confirma que `-c`
é o modo intermediário indicado no próprio projeto para o fluxo `report`.

O Makefile do diretório `yolo` usa `conv_pipe_v3.8_yolo.cl`; seu modo
`FLOW=report` também executa `aoc -v -c -report` com a biblioteca RTL
(`yolo/Makefile`, linhas 22–28 e 114–125). O fluxo padrão desse diretório é
`hw`, não `report`.

## Diferenças de configuração relevantes

| Variante | `VEC_SIZE` | `LANE_NUM` | Outros parâmetros ativos |
|---|---:|---:|---|
| `project_intel` do pai | 16 | 16 | `CONV_GP_SIZE_X=7`, `PIPE_DEPTH=6` |
| `yolo` do pai | 16 | 8 | `PE_NUM_Y` depende de `Image_Resolution` |
| Winograd atual | 16 | 32 | `W_VEC_SIZE=6`, `WEIGHT_W_VEC_SIZE=6`, `CONV_GP_SIZE_X=4`, `PIPE_DEPTH=6` |

Fontes: `project_intel/device/hw_param.cl` (linhas 43–50),
`yolo/device/hw_param.cl` (linhas 60–64, 194–198) e o checkout atual
`project/device/hw_param.cl` (linhas 79–88).

No Winograd, `FPGA_DSP_NUM=1518*2=3036`. A condição do kernel
`LANE_NUM*VEC_SIZE*6 > FPGA_DSP_NUM` é verdadeira para os parâmetros ativos:
`32*16*6=3072`. Ela seleciona uma ramificação especial do MAC em
`project/device/conv_pipe.cl` (linhas 701–705 e 759–765). Reduzir `LANE_NUM`
para 16 remove essa condição e muda o caminho de MAC; uma compilação mais
rápida nesse caso não isolaria o efeito do número de lanes.

Essas diferenças tornam o kernel YOLO do pai um possível controle de
compilação, mas não um controle de uma única variável: ele não implementa o
mesmo código Winograd e usa menos lanes.

## Limite do `rtl_lib.aoco` encontrado no pai

O único artefato AOCL correspondente aos padrões `.aoco`, `.aocr`, `.aocx` e
`report.html` encontrado no pai é o arquivo rastreado
`yolo/device/RTL/rtl_lib.aoco`. Ele é produzido pela regra de biblioteca
`aocl library hdl-comp-pkg rtl_lib.xml -o rtl_lib.aoco`, seguida de
`aocl library create` (`yolo/device/RTL/Makefile`, linhas 1–5). Portanto é a
biblioteca de funções IP, não o `.aoco` do kernel YOLO nem um arquivo RTL
completo do acelerador.

O `rtl_lib.xml` do pai declara `mult_add_fix8bx4` com entradas de 8 bits, saída
de 32 bits e latência fixa de dois ciclos (`yolo/device/RTL/rtl_lib.xml`, linhas
136–200). A biblioteca atual do Winograd declara `mult_add_fix8bx16bx4`, com
entradas 16×8, saída de 32 bits e latência fixa de dois ciclos
(`project/device/RTL/rtl_lib.xml`, linhas 4–68). O artefato do pai, portanto,
não substitui a biblioteca do fork e não contém o RTL gerado para o kernel.

Não encontrei no projeto pai um `.aoco`/`.aocr` do kernel, `.aocx` ou relatório
HTML que registre uma compilação completa desses kernels.

## Consequência para o diagnóstico atual

O projeto pai confirma a incompatibilidade de edição no caminho `-rtl`, mas
não explica por que o `aoc -c` aceitou `s5_ref`, concluiu o parser e permaneceu
na otimização estática até o timeout de 600 segundos. Esse resultado continua
sendo evidência de otimização longa nesse kernel e nessa configuração; não
prova travamento permanente nem conclusão eventual.

O próximo controle mais informativo é compilar, em outro diretório isolado e
com o mesmo AOCL 18.1 Standard e o mesmo alvo `s5_ref`, o kernel original
`yolo/device/conv_pipe_v3.8_yolo.cl` usando o modo `report` (`-c -report`).
Registrar alvo, parâmetros, etapas, tempo, CPU, memória, status e artefatos.
Se esse controle terminar e o Winograd não, a diferença aponta para custo
específico do kernel/configuração Winograd, sem isolar uma única causa. Se
ambos pararem na mesma etapa, aumenta a suspeita sobre o compilador ou ambiente.

Como `s5_ref` não é Arria 10, esse controle serve apenas para comparar a etapa
intermediária do compilador; não reproduz o alvo original do projeto. Para
gerar RTL do design Arria 10, o fluxo documentado pelo pai requer um ambiente
AOCL/Quartus Pro compatível.
