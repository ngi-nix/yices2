/*
 * Concrete values = constants of different types.
 * This is used to build models: a model is a mapping from terms to concrete values.
 *
 * The table is divided into two parts:
 * - permanent objects = objects that must be kept in the model
 * - temporary objects = objects created when evaluating the value of a non-atomic term.
 * The temporary objects can be deleted.
 *
 * The implementation works in two modes:
 * - default mode: create permanent objects
 * - tmp mode: all objects created are temporary and are deleted when
 *   tmp_mode is exited.
 *
 * We attempt to ensure that different objects in the table actually
 * represent different values. But this is hard to ensure for
 * functions. So we attach a "canonical flag" to each object:
 * - if the bit is 1 for object i then i is in a canonical representation.
 *   An object j with a different descriptor cannot be equal to i.
 * - if the bit is 0, then i is not in a canonical form.
 */

#ifndef __CONCRETE_VALUES_H
#define __CONCRETE_VALUES_H

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>

#include "types.h"
#include "rationals.h"
#include "bitvectors.h"
#include "bv_constants.h"
#include "int_hash_tables.h"

#include "yices_pp.h"

/*
 * Each concrete value is identified by an integer index.
 * A type and descriptor for each value is stored in a table.
 * We use hash consing.
 *
 * The concrete types are
 *  UNKNOWN_VALUE
 *  BOOLEAN_VALUE
 *  RATIONAL_VALUE
 *  BITVECTOR_VALUE
 */

/*
 * Value indices = signed integers
 */
typedef int32_t value_t;


/*
 * null_value means no value assigned yet.
 * This is different from UNKNOWN_VALUE.
 */
enum {
  null_value = -1,
};


/*
 * Types
 */
typedef enum {
  UNKNOWN_VALUE,
  BOOLEAN_VALUE,
  RATIONAL_VALUE,
  BITVECTOR_VALUE,
} value_kind_t;


/*
 * Value stored in the table:
 * - either an integer or a rational or a pointer to an object descriptor
 */
typedef union value_desc_u {
  int32_t integer;
  rational_t rational;
  void *ptr;
} value_desc_t;


/*
 * Descriptors: encode the actual value
 */
// bitvector constant
typedef struct value_bv_s {
  uint32_t nbits;
  uint32_t width;   // size in words = ceil(nbits/32)
  uint32_t data[0]; // real size = width
} value_bv_t;


/*
 * Table of concrete objects
 * - valid objects have indices between 0 and nobjects - 1
 * - for each object,
 *   kind[i] = its type
 *   desc[i] = its descriptor
 *   canonical[i] = one bit: 1 means i is in a canonical form
 *                           0 means it's not
 * - other components:
 *   type_table = pointer to an associated type table
 *   htbl = hash table for hash consing
 *   buffer for building bitvector constants
 * - unknown_value = index of the unknown value
 * - true_value, false_value = indices of true/false values
 *
 * - first_tmp = index of the first temporary object
 *   if first_tmp = -1 then all objects are permanent.
 *   if first_tmp >= 0, then objects in [0 .. first_tmp -1] are permanent
 *   and objects in [first_tmp .. nobjects - 1] are temporary.
 *
 * - pointer for getting names of uninterpreted constants
 */
typedef struct value_table_s {
  uint32_t size;
  uint32_t nobjects;
  uint8_t *kind;
  value_desc_t *desc;
  byte_t *canonical; // bitvector

  type_table_t *type_table;
  int_htbl_t htbl;
  bvconstant_t buffer;
  //  rational_t aux;

  int32_t unknown_value;
  int32_t true_value;
  int32_t false_value;
  int32_t first_tmp;

} value_table_t;


#define DEF_VALUE_TABLE_SIZE 200
#define MAX_VALUE_TABLE_SIZE (UINT32_MAX/sizeof(value_desc_t))




/*
 * INITIALIZATION
 */

/*
 * Initialize a table;
 * - n = initial size. If n is zero, the default size is used.
 * - ttbl = attached type table.
 */
extern void init_value_table(value_table_t *table, uint32_t n, type_table_t *ttbl);

/*
 * Delete table: free all memory
 */
extern void delete_value_table(value_table_t *table);

/*
 * Reset: empty the table
 */
extern void reset_value_table(value_table_t *table);


/*
 * OBJECT CONSTRUCTORS
 */

/*
 * Undefined value
 */
extern value_t vtbl_mk_unknown(value_table_t *table);

/*
 * Boolean constant: val = 0 means false, val != 0 means true
 */
extern value_t vtbl_mk_bool(value_table_t *table, int32_t val);
extern value_t vtbl_mk_true(value_table_t *table);
extern value_t vtbl_mk_false(value_table_t *table);

/*
 * Negate v (v must be either true or false)
 */
extern value_t vtbl_mk_not(value_table_t *table, value_t v);


/*
 * Rational (or integer) constant (make a copy)
 */
extern value_t vtbl_mk_rational(value_table_t *table, rational_t *v);
extern value_t vtbl_mk_int32(value_table_t *table, int32_t x);


/*
 * Bit-vector constant: input is an array of n integers
 * - bit i is 0 if a[i] == 0
 * - bit i is 1 if a[i] != 0
 * So a[0] = low order bit, a[n-1] = high order bit
 */
extern value_t vtbl_mk_bv(value_table_t *table, uint32_t n, int32_t *a);

/*
 * Variant: the input is an array of 32bit words
 * - n = number of bits
 * - a = array of w words where w = ceil(n/32)
 */
extern value_t vtbl_mk_bv_from_bv(value_table_t *table, uint32_t n, uint32_t *a);

/*
 * Variant: input is a bvconstant object
 * - b->bitsize = number of bits
 * - b->data = bits (stored as an array of uint32_t integers)
 */
extern value_t vtbl_mk_bv_from_constant(value_table_t *table, bvconstant_t *b);

/*
 * Variant: input is a 64bit unsigned integer
 * - n = number of bits to use (n <= 64)
 * - c = integer constant
 */
extern value_t vtbl_mk_bv_from_bv64(value_table_t *table, uint32_t n, uint64_t c);



/*
 * TEMPORARY OBJECTS
 */

/*
 * Switch to temporary mode:
 * - all objects currently in the table are considered permanent.
 * - all terms created after this function is called are temporary.
 * - the table must not be in temporary mode already.
 *
 * Side effect: creates the unknown, true, and false values if they
 * don't exist already. These are always permanent terms.
 *
 * Warning: the permanent terms must not be modified after this.
 * So add_map and set_function_default should not be called with a permanent f.
 */
extern void value_table_start_tmp(value_table_t *table);


/*
 * Delete all temporary objects and return to permanent mode.
 * Do nothing if the table is not in temporary mode.
 */
extern void value_table_end_tmp(value_table_t *table);





/*
 * PRINTING
 */

/*
 * Print object c
 * - c must be a valid object in table
 * - no pretty printing for now
 * - functions are printed as uninterpreted objects
 */
extern void vtbl_print_object(FILE *f, value_table_t *table, value_t c);



/*
 * PRETTY PRINTING
 */

/*
 * Same print functions as above, but using a pretty_printer object
 */
extern void vtbl_pp_object(yices_pp_t *printer, value_table_t *table, value_t c);


/*
 * EVALUATION
 */

/*
 * Check whether a and b are equal
 * - return unknown if we can't tell
 */
extern value_t vtbl_eval_eq(value_table_t *table, value_t a, value_t b);


/*
 * Check whether arrays a[0 ... n-1] and b[0 ... n-1] are equal
 * - return unknown if we can't tell
 */
extern value_t vtbl_eval_array_eq(value_table_t *table, value_t *a, value_t *b, uint32_t n);




/*
 * ACCESS TO OBJECT REPRESENTATION
 */
static inline bool good_object(value_table_t *table, value_t v) {
  return 0 <= v && v < table->nobjects;
}

static inline value_kind_t object_kind(value_table_t *table, value_t v) {
  assert(good_object(table, v));
  return (value_kind_t) table->kind[v];
}

// check the type of v
static inline bool object_is_unknown(value_table_t *table, value_t v) {
  return object_kind(table, v) == UNKNOWN_VALUE;
}

static inline bool object_is_boolean(value_table_t *table, value_t v) {
  return object_kind(table, v) == BOOLEAN_VALUE;
}

static inline bool object_is_rational(value_table_t *table, value_t v) {
  return object_kind(table, v) == RATIONAL_VALUE;
}

static inline bool object_is_integer(value_table_t *table, value_t v) {
  return object_is_rational(table, v) && q_is_integer(&table->desc[v].rational);
}

static inline bool object_is_bitvector(value_table_t *table, value_t v) {
  return object_kind(table, v) == BITVECTOR_VALUE;
}


/*
 * Check the canonical bit
 */
static inline bool object_is_canonical(value_table_t *table, value_t v) {
  assert(good_object(table, v));
  return tst_bit(table->canonical, v);
}




// check value of v
static inline bool is_unknown(value_table_t *table, value_t v) {
  assert(good_object(table, v));
  return v == table->unknown_value;
}

static inline bool is_true(value_table_t *table, value_t v) {
  assert(good_object(table, v));
  return v == table->true_value;
}

static inline bool is_false(value_table_t *table, value_t v) {
  assert(good_object(table, v));
  return v == table->false_value;
}

static inline bool boolobj_value(value_table_t *table, value_t v) {
  assert(object_is_boolean(table, v));
  return (bool) table->desc[v].integer;
}


// get descriptor of v
static inline rational_t *vtbl_rational(value_table_t *table, value_t v) {
  assert(object_is_rational(table, v));
  return &table->desc[v].rational;
}

static inline value_bv_t *vtbl_bitvector(value_table_t *table, value_t v) {
  assert(object_is_bitvector(table, v));
  return (value_bv_t *) table->desc[v].ptr;
}




#endif /* __CONCRETE_VALUES_H */