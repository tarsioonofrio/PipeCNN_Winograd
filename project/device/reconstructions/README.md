# Reconstruções RTL

Esta pasta reúne implementações RTL feitas manualmente a partir da leitura dos
kernels OpenCL e do comportamento descrito no código. Elas são reconstruções
de partes do PipeCNN para análise e simulação; não são RTL recuperado pelo AOCL
nem equivalência temporal com o escalonamento do compilador.

## Conteúdo

- `asic_mac4_i16_i8/`: candidato SystemVerilog para o MAC de quatro produtos.
- `asic_reconstruction_f43/`: transformadas Winograd F(4,3), redução dot9 e
  núcleo de tile de um canal.
- `opencl_memread_compute/`: fatia aritmética e pós-processamento de `memRead`.
- `opencl_win_buffer/`: buffers, contadores e integração reconstruída de
  `memRead`, pooling e `memWrite`.
- `opencl_pool/`: pooling 2x2 e integração reduzida com `memWrite`.
- `opencl_memwrite/`: seleção, ordenação, padding e endereçamento de saída.

Cada subpasta documenta o escopo, as hipóteses e os limites da sua
implementação. Os runners também ficam junto dos módulos que exercitam.
