#ifndef CONV_OUT_H
#define CONV_OUT_H
#include "denoiser.h"

const fixed_t conv_out_kernel[36] = {
    fixed_t(-0.27788016f), fixed_t(-0.44271481f), fixed_t(0.04853189f), fixed_t(-0.44077554f), fixed_t(-0.75176728f), fixed_t(-0.29121917f), fixed_t(-0.12420877f), fixed_t(-0.31382218f), 
    fixed_t(0.50081545f), fixed_t(-0.08879994f), fixed_t(-0.07968111f), fixed_t(0.29290795f), fixed_t(-0.16971065f), fixed_t(0.32783398f), fixed_t(-0.36981413f), fixed_t(0.28092054f), 
    fixed_t(0.00569308f), fixed_t(-0.15108168f), fixed_t(-0.07451226f), fixed_t(-0.22723076f), fixed_t(-0.32782605f), fixed_t(-0.47081959f), fixed_t(0.11024307f), fixed_t(0.29615822f), 
    fixed_t(-0.56706047f), fixed_t(-0.40652198f), fixed_t(-0.35868931f), fixed_t(0.33353391f), fixed_t(0.30745324f), fixed_t(0.63388377f), fixed_t(0.37358773f), fixed_t(0.05334228f), 
    fixed_t(0.62976712f), fixed_t(0.31434828f), fixed_t(-0.09215885f), fixed_t(0.59617138f)
};

const fixed_t conv_out_bias[1] = {
    fixed_t(-0.19585617f)
};
#endif
