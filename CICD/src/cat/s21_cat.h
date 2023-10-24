#ifndef SRS_CAT_S21_CAT_H_
#define SRS_CAT_S21_CAT_H_
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

struct allFlags {
  int bFlag;
  int eFlag;
  int nFlag;
  int sFlag;
  int tFlag;
  int vFlag;
};

int parser(char **argv, struct allFlags *flags);
int opFile(int argc, char **argv, struct allFlags *flags, int count);
void printFile();
void flag_v(int *ch);
#endif  // SRS_CAT_S21_CAT_H_