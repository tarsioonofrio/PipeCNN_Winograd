# Reconstrução controlada de F(4,3)

Os módulos de transformação reexpressam em SystemVerilog as equações `BT*d` e
`A^T*m` de `project/device/conv_pipe.cl`. A entrada trunca para 16 bits, como a
atribuição OpenCL a `CONVTYPE`; a saída trunca para 32 bits, como `MACTYPE`. O
testbench compara vetores determinísticos, extremos e aleatórios com uma
referência aritmética independente, incluindo wraparound.

`winograd_f43_dot9_mac4.sv` reduz nove produtos signed 16×16 por posição de
transformação em três ciclos, usando quatro multiplicadores e wrap de soma em
32 bits. `winograd_f43_3x3_tile_core.sv` instancia nove transformadores de
entrada e calcula quatro posições horizontais para um único canal de saída.
Os seis produtos Winograd são serializados; a latência medida pelo testbench é
31 ciclos por tile, incluindo captura e transformação de saída.

O testbench do tile gera pesos `24*G*g` em forma inteira exata a partir de
pesos espaciais pequenos, para comparar a saída Winograd com uma convolução
horizontal direta escalada por 24. Os valores de teste evitam overflow antes
da comparação. Isso valida a álgebra, o empacotamento, o schedule local e o
wrap de 32 bits dentro desse domínio; não valida a quantização real dos pesos
nem o comportamento de overflow para qualquer entrada int16.

O núcleo ainda não implementa o kernel completo: falta percorrer os 30×30
resultados, repetir para os três canais de saída, reproduzir os acumuladores,
buffers, canais, pooling, interface host e FSM de `conv_pipe.cl`. O RTL AOCL
gerado também não foi recuperado. Portanto, esta reconstrução não prova
equivalência funcional/temporal com a implementação OpenCL nem mede PPA do
sistema.

Execute os scripts a partir da raiz do checkout:

- `./project/device/reconstructions/asic_reconstruction_f43/run_test.sh` — os dois
  transformadores e wraparound;
- `./project/device/reconstructions/asic_reconstruction_f43/run_dot9_test.sh` — a
  redução de nove termos, quatro multiplicadores e latência de três ciclos;
- `./project/device/reconstructions/asic_reconstruction_f43/run_tile_test.sh` —
  128 tiles F(4,3), quatro saídas horizontais e latência de 31 ciclos.
