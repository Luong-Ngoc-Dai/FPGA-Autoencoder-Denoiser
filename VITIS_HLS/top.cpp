// top.cpp
#include "denoiser.h"

void denoiser_top(fixed_t input[784], fixed_t output[784]) {
    #pragma HLS INTERFACE m_axi port=input offset=slave bundle=gmem0 depth=784
    #pragma HLS INTERFACE m_axi port=output offset=slave bundle=gmem1 depth=784
    #pragma HLS INTERFACE s_axilite port=return bundle=control

	static fixed_t buffer_A[28][28][8];
	static fixed_t buffer_B[28][28][8];

	#pragma HLS ARRAY_PARTITION variable=buffer_A complete dim=3
    #pragma HLS ARRAY_PARTITION variable=buffer_B complete dim=3
    #pragma HLS BIND_STORAGE variable=buffer_A type=RAM_1P impl=BRAM
    #pragma HLS BIND_STORAGE variable=buffer_B type=RAM_1P impl=BRAM

    Denoiser d;

    // 1. Burst Read
    for (int i = 0; i < 784; i++) {
        #pragma HLS PIPELINE II=1
        buffer_A[i / 28][i % 28][0] = input[i];
    }

    // 2. Inference (Truyền thêm buffer vào)
    d.inference((const fixed_t(*)[28][1])buffer_A,
                (fixed_t(*)[28][1])buffer_B,
                buffer_A,
                buffer_B);

    // 3. Burst Write
    for (int i = 0; i < 784; i++) {
        #pragma HLS PIPELINE II=1
        output[i] = buffer_B[i / 28][i % 28][0];
    }
}
