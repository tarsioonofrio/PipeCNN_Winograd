# Bambu HLS do MAC de quatro produtos

Este experimento verifica se um HLS alternativo consegue gerar RTL a partir
da operação aritmética de quatro produtos usada por `memRead` em
`project/device/conv_pipe.cl`. A entrada C preserva `CONVTYPE=short`,
`DPTYPE=char` signed e a soma em 32 bits. Cada produto tem operandos signed de
16 e 8 bits; a soma cabe no resultado signed de 26 bits do IP Intel, que é
estendido para 32 bits no kernel.

Isto sintetiza somente o bloco MAC. Não inclui os dois kernels, canais Intel,
buffers locais, endereçamento, pooling, controle AOCL ou interface de memória.
O arquivo C é uma extração de nível de fonte para HLS, não uma compilação
direta de OpenCL nem uma reprodução comprovadamente equivalente da
microarquitetura AOCL.

## Execução registrada

Na Paxos foi usada a AppImage oficial do Bambu/PandA 2024.10. A ferramenta foi
mantida em `/sim/tarsio/bambu-2024.10.AppImage`, sem instalação no sistema;
SHA-256: `e4f0214496a5d35de1932975b0f41cd95bc33a53a904fc565d6c2cb01df40773`.

Comando da variante Nangate45:

```bash
bambu --top-fname=mac4_i16_i8 \
  --device-name=nangate45 --clock-period=10ns \
  --output-temporary-directory=/sim/tarsio/hls_bambu_mac4_20261007/panda-temp \
  mac4_i16_i8.c
```

O comando foi executado no diretório de experimento em `/sim/tarsio`, usando a
entrada `mac4_i16_i8.c`. O Verilog e o log estão preservados em
`nangate45/`. Também foi gerada a configuração padrão do Bambu; seus RTL e log
estão no diretório pai. Os logs completos registram comandos, schedule e
estimativas.

| Configuração Bambu | Ciclos no relatório | FF estimados | DSPs estimados | Área estimada pelo Bambu | Fmáx estimada |
|---|---:|---:|---:|---:|---:|
| Padrão | 2 | 73 | 4 | 123 unidades internas | 127,25 MHz |
| `nangate45`, 10 ns | 1 | 0 | 0 | 13.399 unidades do modelo | 231,20 MHz |

Esses valores são estimativas do HLS e não resultados de Genus, Joules,
place-and-route, área física ou potência. As unidades de área das duas
configurações não devem ser comparadas entre si. No testbench, `done_port` foi
observado após uma borda de clock em ambas as variantes; isso diverge da
contagem de 2 ciclos do relatório da configuração padrão e precisa ser
reconciliado antes de usar latência em comparações arquiteturais.

## Validação funcional

`tb_mac4_i16_i8.sv` compara o RTL com produtos signed calculados em 64 bits.
Foram simulados quatro vetores dirigidos, incluindo os extremos dos operandos,
e 32 vetores pseudoaleatórios. As variantes padrão e Nangate45 passaram os 36
vetores com Verilator 5.050.

Para repetir a simulação local das duas variantes:

```bash
./project/device/experiments/bambu/mac4_i16_i8/run_verilator.sh
```

Os warnings de expansão de 24 para 26 bits no somador gerado são da extensão
dos produtos para a soma; o testbench cobre os extremos signed e passou.
