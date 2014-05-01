/*
 * Simple PRNG based on a linear congruence modulo 2^32.
 *
 * Recurrence X_{t+1} = (a X_t + b) mod 2^32
 * - X_0 is the seed,
 * - a = 1664525,
 * - b = 1013904223
 * (Source: Wikipedia + Knuth's Art of Computer Programming, Vol. 2)
 *
 * The low-order bits are not random.
 *
 * Note: the state of the PRNG (variable seed) is local.
 * So every file that imports this will have its own copy of the PRNG,
 * and all copies have the same default seed.
 */

#ifndef __PRNG_H
#define __PRNG_H

#include <stdint.h>

#define PRNG_MULTIPLIER 1664525
#define PRNG_CONSTANT   1013904223

#define PRNG_DEFAULT_SEED 0xabcdef98

static inline void random_seed(uint32_t *seedp, uint32_t s) {
  *seedp = s;
}

static inline uint32_t random_uint32(uint32_t *seedp) {
  uint32_t x = *seedp;
  *seedp = x * ((uint32_t) PRNG_MULTIPLIER) + ((uint32_t) PRNG_CONSTANT);
  return x;
}

static inline int32_t random_int32(uint32_t *seedp) {
  return (int32_t) random_uint32(seedp);
}

// random integer between 0 and n-1 (remove 8 low-order bits)
static inline uint32_t random_uint(uint32_t *seedp, uint32_t n) {
  return (random_uint32(seedp) >> 8) % n;
}



#endif


