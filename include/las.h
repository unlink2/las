#ifndef lasH__
#define lasH__

#include <stdint.h>

struct las_type {
  const char *tag;
  int8_t bits;
};

struct las_config {
  _Bool verbose;
};

int las_main(struct las_config *cfg);

#endif
