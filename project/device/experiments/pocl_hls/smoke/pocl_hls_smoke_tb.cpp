#include <ap_int.h>

#include <cstdio>

void pocl_mlir_command_buffer(ap_int<32> out[4]);

int main() {
  ap_int<32> out[4] = {-1, -1, -1, -1};
  const int expected[4] = {90, 93, 96, 99};

  pocl_mlir_command_buffer(out);

  for (int i = 0; i < 4; ++i) {
    const int actual = out[i].to_int();
    if (actual != expected[i]) {
      std::fprintf(stderr, "out[%d]: expected %d, got %d\n", i, expected[i],
                   actual);
      return 1;
    }
  }

  std::puts("PASS: out[0..3] = {90, 93, 96, 99}");
  return 0;
}
