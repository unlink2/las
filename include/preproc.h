#ifndef PREPROC_H_
#define PREPROC_H_

enum las_pptokentype { LAS_PPTOK_LITERAL };

struct las_pptoken {
  const char *raw;
  enum las_pptokentype type;
};

struct las_ppmacro {};

struct las_ppdef {};

#endif
