/* Minimal OpenCL C kernel with a non-degenerate global-memory output. */
__kernel void pocl_hls_smoke(__global int *out)
{
    size_t gid = get_global_id(0);
    out[gid] = (int)(gid * 3 + 90);
}
