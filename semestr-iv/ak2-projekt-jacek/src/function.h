#ifndef RATIONAL_H
#define RATIONAL_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef enum { POSITIVE, NEGATIVE } sign_t;

sign_t rational_get_sign(uint64_t) __attribute__((optimize(0)));
uint64_t rational_set_sign(uint64_t, sign_t) __attribute__((optimize(0)));
uint32_t rational_get_numerator(uint64_t) __attribute__((optimize(0)));
uint64_t rational_set_numerator(uint64_t, uint32_t) __attribute__((optimize(0)));
uint32_t rational_get_denominator(uint64_t) __attribute__((optimize(0)));
uint64_t rational_set_denominator(uint64_t, uint32_t) __attribute__((optimize(0)));
int rational_get_flag(uint64_t) __attribute__((optimize(0)));
uint64_t rational_new(sign_t, uint32_t, uint32_t);

uint64_t rational_inv(uint64_t) __attribute__((optimize(0)));
uint64_t rational_mul(uint64_t, uint64_t) __attribute__((optimize(0)));
uint64_t rational_div(uint64_t, uint64_t);
uint64_t rational_sub(uint64_t, uint64_t) __attribute__((optimize(0)));
uint64_t rational_add(uint64_t, uint64_t) __attribute__((optimize(0)));
uint64_t rational_sim(uint64_t) __attribute__((optimize(0)));
int rational_compare(uint64_t, uint64_t);

uint64_t rational_normalize(uint64_t, uint64_t) __attribute__((optimize(0)));

double rational_to_double(uint64_t);
uint64_t double_to_rational(double) __attribute__((optimize(0)));
char *rational_print(uint64_t);

#endif
