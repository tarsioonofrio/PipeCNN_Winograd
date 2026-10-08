module {
  func.func @pocl_mlir_command_buffer(%arg0: !hls.axi<memref<4xi32, #hls.mem<bram_t2p>>>) attributes {CL_arg_count = 1 : i64, CL_command_buffer, gpu.kernel, top_func} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c3_i64 = arith.constant 3 : i64
    %c90_i64 = arith.constant 90 : i64
    %0 = hls.axi.bundle "axi_0" : <i32, mm>
    %1 = hls.axi.port %0, %arg0 {aliasingGroup = "aliasing_group_0"} : <i32, mm>, (!hls.axi<memref<4xi32, #hls.mem<bram_t2p>>>) -> memref<4xi32, #hls.mem<bram_t2p>>
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %2 = arith.index_cast %arg1 : index to i64
      %3 = arith.muli %2, %c3_i64 : i64
      %4 = arith.addi %3, %c90_i64 : i64
      %5 = arith.trunci %4 : i64 to i32
      memref.store %5, %1[%arg1] : memref<4xi32, #hls.mem<bram_t2p>>
      scf.reduce 
    }
    return
  }
}
