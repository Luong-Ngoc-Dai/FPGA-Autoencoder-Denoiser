#include "denoiser.h"
#include "conv_out_weights.h"
#include "conv1_weights.h"
#include "conv2_weights.h"
#include "conv3_weights.h"

// Constructor
Denoiser::Denoiser() {}

// Destructor
Denoiser::~Denoiser() {}

// Layer 1: Conv2D 1 → 4
void Denoiser::conv2d_1(const fixed_t input[28][28][1], fixed_t output[28][28][4]) {
	#pragma HLS INLINE
	  loop_oc_1:
	    for (int n = 0; n < 4; n++) {          // n = oc (ngoài cùng như Py2C)
	        loop_h_1:
	        for (int x = 0; x < 28; x++) {
	            loop_w_1:
	            for (int y = 0; y < 28; y++) {
	                #pragma HLS PIPELINE II=1
	                fixed_t s = conv1_bias[n];
	                loop_kh_1:
	                for (int i = 0; i < 3; i++) {
	                    #pragma HLS UNROLL
	                    loop_kw_1:
	                    for (int j = 0; j < 3; j++) {
	                        #pragma HLS UNROLL
	                        int ih = x + i - 1;
	                        int iw = y + j - 1;
	                        fixed_t val = (ih >= 0 && ih < 28 && iw >= 0 && iw < 28)
	                                      ? input[ih][iw][0] : fixed_t(0);
	                        // index giống Py2C: kernel[oc*ic*kH*kW + ic*kH*kW + kH*i + j]
	                        s += val * conv1_kernel[n*9 + i*3 + j];
	                    }
	                }
	                output[x][y][n] = relu(s);
	            }
	        }
	    }
	}

// Layer 2: MaxPool 28x28 → 14x14
void Denoiser::maxpool_2x2_4ch(const fixed_t input[28][28][4], fixed_t output[14][14][4]) {
	#pragma HLS INLINE
	#pragma HLS ARRAY_PARTITION variable=input complete dim=3
	#pragma HLS ARRAY_PARTITION variable=output complete dim=3
    for (int h = 0; h < 14; h++) {
        for (int w = 0; w < 14; w++) {
            for (int c = 0; c < 4; c++) {
				  #pragma HLS PIPELINE II=1
            	  fixed_t max_val = input[h*2][w*2][c];
            	  fixed_t v1 = input[h*2][w*2+1][c];
                  if (v1 > max_val) max_val = v1;
            	  fixed_t v2 = input[h*2+1][w*2][c];
            	  if (v2 > max_val) max_val = v2;
            	  fixed_t v3 = input[h*2+1][w*2+1][c];
            	  if (v3 > max_val) max_val = v3;
            	  output[h][w][c] = max_val;
            }
        }
    }
}

// Layer 3: Conv2D 4 → 8
void Denoiser::conv2d_2(const fixed_t input[14][14][4], fixed_t output[14][14][8]) {
	#pragma HLS INLINE
	 loop_oc_2:
	    for (int n = 0; n < 8; n++) {
	        loop_h_2:
	        for (int x = 0; x < 14; x++) {
	            loop_w_2:
	            for (int y = 0; y < 14; y++) {
	                #pragma HLS PIPELINE II=1
	                fixed_t s = conv2_bias[n];
	                loop_kh_2:
	                for (int i = 0; i < 3; i++) {
	                    #pragma HLS UNROLL
	                    loop_kw_2:
	                    for (int j = 0; j < 3; j++) {
	                        #pragma HLS UNROLL
	                        loop_ic_2:
	                        for (int k = 0; k < 4; k++) {
	                            #pragma HLS UNROLL
	                            int ih = x + i - 1;
	                            int iw = y + j - 1;
	                            fixed_t val = (ih >= 0 && ih < 14 && iw >= 0 && iw < 14)
	                                          ? input[ih][iw][k] : fixed_t(0);
	                            // n*ic*kH*kW + k*kH*kW + i*kW + j
	                            s += val * conv2_kernel[n*36 + k*9 + i*3 + j];
	                        }
	                    }
	                }
	                output[x][y][n] = relu(s);
	            }
	        }
	    }
	}
// Layer 4: UpSample 14x14 → 28x28 (Nearest Neighbor)
void Denoiser::upsample_2x2_8ch(const fixed_t input[14][14][8], fixed_t output[28][28][8]) {
	#pragma HLS INLINE
	#pragma HLS ARRAY_PARTITION variable=input complete dim=3
	 #pragma HLS ARRAY_PARTITION variable=output complete dim=3
	for (int h = 0; h < 14; h++) {
        for (int w = 0; w < 14; w++) {
            for (int c = 0; c < 8; c++) {
				#pragma HLS PIPELINE II=1
                fixed_t val = input[h][w][c];
                output[h * 2][w * 2][c] = val;
                output[h * 2][w * 2 + 1][c] = val;
                output[h * 2 + 1][w * 2][c] = val;
                output[h * 2 + 1][w * 2 + 1][c] = val;
            }
        }
    }
}

// Layer 5: Conv2D 8 → 4
void Denoiser::conv2d_3(const fixed_t input[28][28][8], fixed_t output[28][28][4]) {
	#pragma HLS INLINE
	  loop_oc_3:
	    for (int n = 0; n < 4; n++) {
	        loop_h_3:
	        for (int x = 0; x < 28; x++) {
	            loop_w_3:
	            for (int y = 0; y < 28; y++) {
	                #pragma HLS PIPELINE II=1
	                fixed_t s = conv3_bias[n];
	                loop_kh_3:
	                for (int i = 0; i < 3; i++) {
	                    #pragma HLS UNROLL
	                    loop_kw_3:
	                    for (int j = 0; j < 3; j++) {
	                        #pragma HLS UNROLL
	                        loop_ic_3:
	                        for (int k = 0; k < 8; k++) {
	                            #pragma HLS UNROLL
	                            int ih = x + i - 1;
	                            int iw = y + j - 1;
	                            fixed_t val = (ih >= 0 && ih < 28 && iw >= 0 && iw < 28)
	                                          ? input[ih][iw][k] : fixed_t(0);
	                            s += val * conv3_kernel[n*72 + k*9 + i*3 + j];
	                        }
	                    }
	                }
	                output[x][y][n] = relu(s);
	            }
	        }
	    }
	}

// Layer 6: Output Conv2D 4 → 1
void Denoiser::conv2d_out(const fixed_t input[28][28][4], fixed_t output[28][28][1]) {
	#pragma HLS INLINE
	 loop_h_out:
	    for (int x = 0; x < 28; x++) {
	        loop_w_out:
	        for (int y = 0; y < 28; y++) {
	            #pragma HLS PIPELINE II=1
	            fixed_t s = conv_out_bias[0];
	            loop_kh_out:
	            for (int i = 0; i < 3; i++) {
	                #pragma HLS UNROLL
	                loop_kw_out:
	                for (int j = 0; j < 3; j++) {
	                    #pragma HLS UNROLL
	                    loop_ic_out:
	                    for (int k = 0; k < 4; k++) {
	                        #pragma HLS UNROLL
	                        int ih = x + i - 1;
	                        int iw = y + j - 1;
	                        fixed_t val = (ih >= 0 && ih < 28 && iw >= 0 && iw < 28)
	                                      ? input[ih][iw][k] : fixed_t(0);
	                        s += val * conv_out_kernel[k*9 + i*3 + j];
	                    }
	                }
	            }
	            output[x][y][0] = sigmoid(s);
	        }
	    }
	}

void Denoiser::inference(const fixed_t input[28][28][1],
		fixed_t output[28][28][1],
		fixed_t buf_A[28][28][8],
        fixed_t buf_B[28][28][8]) {

	// Trong inference() — weights nhỏ nên partition hoàn toàn

	#pragma HLS ARRAY_PARTITION variable=conv1_kernel complete
	#pragma HLS ARRAY_PARTITION variable=conv1_bias complete
	#pragma HLS ARRAY_PARTITION variable=conv2_bias complete
	#pragma HLS ARRAY_PARTITION variable=conv3_bias complete
	#pragma HLS ARRAY_PARTITION variable=conv_out_bias complete
	#pragma HLS ARRAY_PARTITION variable=conv_out_kernel complete

	// conv2_kernel và conv3_kernel lớn hơn → dùng cyclic

	#pragma HLS ARRAY_PARTITION variable=conv2_kernel cyclic factor=4
	#pragma HLS ARRAY_PARTITION variable=conv3_kernel cyclic factor=4

	// 1. Phẳng hóa toàn bộ logic để HLS chia sẻ tài nguyên

		// 2. Ép HLS sử dụng RAM 1 cổng (Tiết kiệm 50% BRAM so với RAM 2 cổng mặc định)

	  #pragma HLS INLINE recursive

	  // conv2d_1: input (28x28x1) -> buffer_A (28x28x4)
	  conv2d_1(input, (fixed_t(*)[28][4]) buf_A);
	  // maxpool: buffer_A (28x28x4) -> buffer_B (14x14x4)
	  maxpool_2x2_4ch((fixed_t(*)[28][4]) buf_A, (fixed_t(*)[14][4]) buf_B);
	  // conv2d_2: buffer_B (14x14x4) -> buffer_A (14x14x8)
	  conv2d_2((fixed_t(*)[14][4]) buf_B, (fixed_t(*)[14][8]) buf_A);
	  // upsample: buffer_A (14x14x8) -> buffer_B (28x28x8)
	  upsample_2x2_8ch((fixed_t(*)[14][8]) buf_A, (fixed_t(*)[28][8]) buf_B);
	  // conv2d_3: buffer_B (28x28x8) -> buffer_A (28x28x4)
	  conv2d_3((fixed_t(*)[28][8]) buf_B, (fixed_t(*)[28][4]) buf_A);
	  // conv2d_out: buffer_A (28x28x4) -> output (28x28x1)
	  conv2d_out((fixed_t(*)[28][4]) buf_A, output);
}
