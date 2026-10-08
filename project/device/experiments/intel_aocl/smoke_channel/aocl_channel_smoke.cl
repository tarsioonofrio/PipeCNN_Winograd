#pragma OPENCL EXTENSION cl_intel_channels : enable

channel int smoke_channel __attribute__((depth(2)));

__kernel void smoke_producer(__global const int *src) {
    const int i = (int)get_global_id(0);
    write_channel_intel(smoke_channel, src[i]);
}

__kernel void smoke_consumer(__global int *dst) {
    const int i = (int)get_global_id(0);
    dst[i] = read_channel_intel(smoke_channel);
}
