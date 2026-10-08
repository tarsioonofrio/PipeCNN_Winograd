
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//

#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <hls_vector.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

using namespace std;

/// This is top function.
void pocl_mlir_command_buffer(
  ap_int<32> v0[4]
) {	// L2
  #pragma HLS interface s_axilite port=return
  #pragma HLS interface m_axi offset=slave port=v0 bundle=axi_0

  for (long int v2 = (int)0; v2 < (int)4; v2 += (int)1) {	// L10
    ap_int<64> v3 = v2;	// L11
    ap_int<64> v4 = v3 * (ap_int<64>)3;	// L12
    ap_int<64> v5 = v4 + (ap_int<64>)90;	// L13
    ap_int<32> v6 = v5;	// L14
    v0[v2] = v6;	// L15
  }
}

