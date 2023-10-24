
#ifndef C3_SIMPLEBASHUTILS_0_S21_GREP_H
#define C3_SIMPLEBASHUTILS_0_S21_GREP_H
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFF 1000
typedef struct flags {
  int h;
  int s;
  int o;
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int f;
} allFlags;
int f_flag_handler(char *pattern, char *path);
void parser(int argc, char *argv[], allFlags *flag, char *patternE,
            char *patternF);
void grep(int argc, char *argv[], allFlags *flag, char *patterE, char *buffer);
void process_compiler(char *path, allFlags *flag, char *pattern,
                      int count_file_state);
void file_reader(FILE *fp, allFlags *flag, regex_t reg, char *path,
                 int count_file_state);

#endif  // C3_SIMPLEBASHUTILS_0_S21_GREP_H
