__kernel void writer(write_only pipe int p) { int x = 42; write_pipe(p, &x); }
__kernel void reader(read_only pipe int p, __global int *out) { int x = 0; read_pipe(p, &x); out[0] = x; }
