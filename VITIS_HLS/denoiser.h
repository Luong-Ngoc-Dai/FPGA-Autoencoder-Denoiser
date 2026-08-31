#pragma once
#ifndef DENOISER_H
#define DENOISER_H

#include "ap_fixed.h"
#include "hls_math.h"
#include <cmath>
#include <cstring>

typedef ap_fixed<16, 6> fixed_t;

#define INPUT_SIZE 28
#define OUTPUT_SIZE 28

#define CONV1_IN_CH  1
#define CONV1_OUT_CH 4
#define CONV1_KH 3
#define CONV1_KW 3

#define CONV2_IN_CH  4
#define CONV2_OUT_CH 8
#define CONV2_KH 3
#define CONV2_KW 3

#define CONV3_IN_CH  8
#define CONV3_OUT_CH 4
#define CONV3_KH 3
#define CONV3_KW 3

#define OUTPUT_IN_CH  4
#define OUTPUT_OUT_CH 1
#define OUTPUT_KH 3
#define OUTPUT_KW 3



class Denoiser {

public:

    Denoiser();

    ~Denoiser();

    void inference(const fixed_t input[INPUT_SIZE][INPUT_SIZE][1],
    		fixed_t output[OUTPUT_SIZE][OUTPUT_SIZE][1],
    		fixed_t buffer_A[28][28][8],
            fixed_t buffer_B[28][28][8]);
private:

    // Forward declaration của các layer functions

    void conv2d_1(const fixed_t input[INPUT_SIZE][INPUT_SIZE][1],fixed_t output[INPUT_SIZE][INPUT_SIZE][CONV1_OUT_CH]);
    void maxpool_2x2_4ch(const fixed_t input[INPUT_SIZE][INPUT_SIZE][CONV1_OUT_CH],fixed_t output[INPUT_SIZE / 2][INPUT_SIZE / 2][CONV1_OUT_CH]);
    void conv2d_2(const fixed_t input[14][14][CONV2_IN_CH],fixed_t output[14][14][CONV2_OUT_CH]);
    void upsample_2x2_8ch(const fixed_t input[14][14][CONV2_OUT_CH],fixed_t output[28][28][CONV2_OUT_CH]);
    void conv2d_3(const fixed_t input[28][28][CONV3_IN_CH],fixed_t output[28][28][CONV3_OUT_CH]);
    void conv2d_out(const fixed_t input[28][28][OUTPUT_IN_CH], fixed_t output[28][28][OUTPUT_OUT_CH]);

    // Utility functions
    inline fixed_t relu(fixed_t x) { return x > 0 ? x : (fixed_t)0; }
    // Trong denoiser.h — thay hoàn toàn
    inline fixed_t sigmoid(fixed_t x) {
        #pragma HLS INLINE
        // Clamp để tránh overflow với ap_fixed<16,6>
        fixed_t x_in = (x > fixed_t(7.0)) ? fixed_t(7.0) :
                       (x < fixed_t(-7.0)) ? fixed_t(-7.0) : x;
        // Dùng wider type cho exp để tránh overflow
        ap_fixed<32,16> x_wide = x_in;
        ap_fixed<32,16> exp_val = hls::exp(-x_wide);
        ap_fixed<32,16> result = ap_fixed<32,16>(1) / (ap_fixed<32,16>(1) + exp_val);
        return fixed_t(result);
    }
};

#endif // DENOISER_H
