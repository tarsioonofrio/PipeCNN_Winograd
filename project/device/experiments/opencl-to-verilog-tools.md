# Ferramentas para converter OpenCL em RTL/Verilog

Este inventário separa ferramentas que recebem OpenCL diretamente das que
geram RTL somente depois de uma tradução do kernel para outra linguagem. A
existência de RTL interno, `.xo` ou `.aocr` não significa que a ferramenta
entregue Verilog genérico, autônomo e pronto para síntese ASIC.

## Ferramentas identificadas

| Ferramenta | Entrada | O que pode gerar | Disponibilidade verificada | Adequação a este PipeCNN |
|---|---|---|---|---|
| Intel FPGA SDK for OpenCL (AOCL) | OpenCL C (`.cl`) | Fluxo Intel FPGA; as tentativas interrompidas deixaram VHDL intermediário dos kernels | AOCL 18.1.0 Build 625 Standard está em `/soft64/altera/ferramentas/quartus/18.1/hld/bin/aoc` na Paxos. `module load quartus/18.1` não inclui `hld/bin` no `PATH`; smoke e piloto 4mul passaram `-c` em `s5_ref`. A ajuda não lista `-rtl` nem `.aocr`; os comandos entraram em `quartus_map` e expiraram aos 180 s. Arria 10 segue bloqueado sem Quartus Pro | É o compilador original e a referência mais próxima. A hipótese é que o modo documentado `-rtl` não existe nesta instalação Standard; o VHDL salvo é intermediário, não uma saída ASIC validada |
| AMD Vitis (`v++`) | OpenCL C (`.cl`) no fluxo clássico; também aceita kernels C/C++ | HLS e objeto de kernel `.xo`, ligado depois em saída específica da plataforma AMD | `v++` foi encontrado na Paxos após `module load vitis/2024.2` | É a opção instalada mais direta para tentar compilar uma variante `.cl`. É um fluxo FPGA/Xilinx; extensões Intel, canais e biblioteca `rtl_lib.aoclib` não são portáveis automaticamente |
| PoCL-HLS / AlmaIF HLS | OpenCL C padrão | MLIR/Hida emite C++ para Vitis HLS; o RTL pode ser obtido após `csynth_design`/exportação, parando antes do wrapper AlmaIF e do `.xclbin` | Selecionado para investigação RTL-only. O PoCL-HLS não foi encontrado instalado no checkout nem nos módulos/scratches consultados. Na Paxos, `vitis/2024.2` e `vitis-run` estão disponíveis; `vitis-run --help` confirma o modo HLS. Nenhuma síntese foi iniciada. O README do PoCL-HLS lista Vitis 2022.1 e XRT 2023.2 | Ainda é preciso verificar como interceptar o C++ do cache e invocar Vitis HLS sem prosseguir no backend completo. `cl_intel_channels` e atributos Intel de `conv_pipe.cl` não estão documentados como suportados. Portabilidade do RTL exportado para ASIC não foi validada |
| Bambu / PandA | Principalmente C/C++ (há integração com representações de compilador) | RTL Verilog/VHDL para o bloco sintetizado | O MAC isolado já foi sintetizado com a AppImage Bambu 2024.10 na Paxos; o experimento está em `bambu/mac4_i16_i8/`. Não há comando `bambu` no `PATH` local | Só funciona para este kernel após traduzir ou extrair a lógica OpenCL para C/C++. O resultado registrado cobre o MAC, não o kernel completo |
| Siemens Catapult HLS | C++ ou SystemC | RTL para ASIC ou FPGA | `catapult` foi encontrado na Paxos após `module load catapult/10.5a`; licença e execução real não foram verificadas | É a alternativa mais alinhada a HLS para ASIC, mas não recebe este `.cl` diretamente. Exigiria reescrever a descrição e definir a arquitetura/agenda em C++/SystemC |
| LegUp HLS | C/C++ | Verilog | Não apareceu nos módulos da Paxos nem no `PATH` local consultado; não está instalado neste ambiente | Candidato indireto e legado: exigiria portar o kernel OpenCL para C/C++ e validar compatibilidade. Não é uma opção pronta aqui |

As capacidades de entrada e saída acima estão documentadas pelos próprios
projetos: [AMD Vitis](https://docs.amd.com/r/2024.2-English/ug1702-vitis-accelerated-reference/v-General-Options),
[PoCL-HLS](https://github.com/cpc/pocl-hls),
[Bambu](https://docs.bambuhls.eu/d4/d6e/bambu101_page.html),
[Siemens Catapult](https://www.siemens.com/en-us/products/ic/catapult-high-level-synthesis/hls/c-cplus/)
e [LegUp](https://download-soc.microsemi.com/FPGA/HLS-EAP/docs/legup-9.1-docs/index.html).
Para a situação específica do AOCL e do alvo Arria 10, consulte também
[`../../../opencl.md`](../../../opencl.md) e os scripts do projeto.

## O que não é conversor OpenCL → Verilog

- **Genus** sintetiza RTL para uma biblioteca/tecnologia ASIC; não traduz o
  kernel OpenCL em RTL.
- **Xcelium, Questa e Verilator** simulam RTL; não fazem HLS de OpenCL.
- **Yosys** é uma ferramenta RTL; não é frontend para este kernel OpenCL.
- **Clang/LLVM** podem analisar/transformar OpenCL e emitir representações de
  compilador, mas sozinhos não produzem a arquitetura Verilog deste acelerador.
- **Vitis HLS em modo `--mode hls`** e **Catapult** são fluxos C++/SystemC; a
  possibilidade de compilar OpenCL com `v++` no fluxo clássico não torna o
  modo HLS C++ um conversor genérico para qualquer kernel `.cl`.

## Leitura prática para este projeto

PoCL-HLS / AlmaIF HLS foi escolhido para a próxima investigação porque aceita
OpenCL C e tem código-fonte público. O alvo aqui é o RTL sintetizado pelo Vitis
HLS: o experimento pode parar nessa etapa, sem wrapper AlmaIF, `.xclbin` ou
placa FPGA. O cache PoCL-HLS documenta o C++ HLS intermediário, que pode ser
entregue ao fluxo standalone de Vitis HLS. Ainda falta verificar exatamente
como capturar esse intermediário no backend do PoCL-HLS. A documentação do
Vitis HLS descreve síntese C para RTL e exportação de RTL/IP. Isso não confirma
que o RTL seja independente de recursos AMD ou pronto para ASIC. O PipeCNN usa
canais e atributos Intel que não estão documentados como suportados pelo
PoCL-HLS.

AOCL continua sendo o compilador original, mas a Paxos só tem AOCL 18.1
Standard e a tentativa anterior não confirmou a geração `.aocr`. `v++` também
aceita OpenCL no fluxo AMD, mas produz objetos/bitstreams específicos da
plataforma. Para a situação específica do AOCL e do alvo Arria 10, consulte
[`../../../opencl.md`](../../../opencl.md).

Catapult e Bambu podem gerar RTL que depois siga para síntese ASIC, mas recebem
uma descrição C++/SystemC ou C/C++, respectivamente. Portar o kernel para essas
entradas muda a implementação HLS e pode mudar paralelismo, pipeline, memória e
controle. Esses resultados precisam ser identificados como novas
implementações, não como recuperação ou reprodução automática do RTL AOCL.

Nenhuma ferramenta deste inventário concluiu a conversão das variantes
completas em `intel_aocl/int16_2mul_per_channel` ou
`intel_aocl/int16_4mul_per_channel`. O smoke e o piloto 4mul de uma lane
geraram VHDL intermediário dos kernels, preservado em `intel_aocl/`; ambos os
links AOCL foram encerrados no timeout enquanto o Quartus executava
`quartus_map`, sem `.aocr`. A consulta de disponibilidade na Paxos foi somente
leitura, em 2026-10-08; presença de módulo ou executável não comprova licença
válida nem compilação concluída.
