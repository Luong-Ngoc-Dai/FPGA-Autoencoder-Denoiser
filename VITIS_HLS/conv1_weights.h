#ifndef CONV1_H
#define CONV1_H
#include "denoiser.h"

const fixed_t conv1_kernel[36] = {
    fixed_t(-0.00788369f), fixed_t(-0.06081799f), fixed_t(-0.06240261f), fixed_t(-0.03850200f), fixed_t(-0.11183813f), fixed_t(-0.07175139f), fixed_t(-0.01652110f), fixed_t(-0.01817968f), 
    fixed_t(-0.00503545f), fixed_t(-0.07280668f), fixed_t(-0.08738541f), fixed_t(-0.08720105f), fixed_t(-0.11517972f), fixed_t(0.07781336f), fixed_t(-0.08978187f), fixed_t(-0.10006109f), 
    fixed_t(-0.09760419f), fixed_t(-0.06832496f), fixed_t(0.06946979f), fixed_t(0.28027132f), fixed_t(0.25588542f), fixed_t(0.17688647f), fixed_t(0.34118721f), fixed_t(0.25351593f), 
    fixed_t(0.08119291f), fixed_t(0.13742474f), fixed_t(0.04356919f), fixed_t(0.10944097f), fixed_t(0.00270119f), fixed_t(-0.09437459f), fixed_t(0.28831360f), fixed_t(0.18425253f), 
    fixed_t(0.02644595f), fixed_t(0.37342915f), fixed_t(0.26654637f), fixed_t(0.11337005f)
};

const fixed_t conv1_bias[4] = {
    fixed_t(0.74403286f), fixed_t(0.20645155f), fixed_t(-0.16722646f), fixed_t(-0.56766868f)
};
#endif
