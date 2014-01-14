#include <stdio.h>
#include <inttypes.h>

#include "smt_logic_codes.h"

#define NUM_TESTS 29

static const char * const test_names[] = {
  "NONE",
  "AUFLIA",
  "AUFLIRA",
  "AUFNIRA",
  "LRA",
  "QF_ABV",
  "QF_AUFBV",
  "QF_AUFLIA",
  "QF_AX",
  "QF_BV",
  "QF_IDL",
  "QF_LIA",
  "QF_LRA",
  "QF_NIA",
  "QF_NRA",
  "QF_RDL",
  "QF_UF",
  "QF_UFBV",
  "QF_UFIDL",
  "QF_UFLIA",
  "QF_UFLRA",
  "QF_UFNRA",
  "UFLRA",
  "UFNIA",
  "",
  "badname",
  "ZZZZZZ",
  "QF_BBBBB",
  "AXXX",
};

static const char *const code2string[] = {
  "NONE",
  "AUFLIA",
  "AUFLIRA",
  "AUFNIRA",
  "LRA",
  "QF_ABV",
  "QF_AUFBV",
  "QF_AUFLIA",
  "QF_AX",
  "QF_BV",
  "QF_IDL",
  "QF_LIA",
  "QF_LRA",
  "QF_NIA",
  "QF_NRA",
  "QF_RDL",
  "QF_UF",
  "QF_UFBV",
  "QF_UFIDL",
  "QF_UFLIA",
  "QF_UFLRA",
  "QF_UFNRA",
  "UFLRA",
  "UFNIA",
  "SMT_UNKNOWN",
};

int main() {
  uint32_t i;
  smt_logic_t code;

  for (i=0; i<NUM_TESTS; i++) {
    printf("Testing %s\n", test_names[i]);
    code = smt_logic_code(test_names[i]);
    printf("code = %"PRId32": %s\n\n", (int32_t) code, code2string[code]);
  }

  return 0;
}
