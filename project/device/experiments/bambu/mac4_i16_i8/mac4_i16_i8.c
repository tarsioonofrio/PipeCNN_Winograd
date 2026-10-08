/*
 * Bambu HLS input for the four-product primitive used by conv_pipe.cl.
 *
 * This is a source-level extraction of one arithmetic operation, not a
 * translation of either complete OpenCL kernel. The input types match
 * CONVTYPE=short and DPTYPE=char; the result is the signed sum of four
 * 16x8-bit products, which fits in the 26-bit result of the Intel MAC IP.
 */
int mac4_i16_i8(short a0, signed char b0,
                short a1, signed char b1,
                short a2, signed char b2,
                short a3, signed char b3)
{
    int p0 = (int)a0 * (int)b0;
    int p1 = (int)a1 * (int)b1;
    int p2 = (int)a2 * (int)b2;
    int p3 = (int)a3 * (int)b3;

    return p0 + p1 + p2 + p3;
}
