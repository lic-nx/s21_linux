#include "s21_cat.h"
int main(int argc, char *argv[]) {
  struct allFlags flags = {0};
  if (argc > 1) {
    int count = parser(argv, &flags);
    if (count < 1) {
      fprintf(stderr, "err");
    } else {
      count = opFile(argc, argv, &flags, count);
      if (count < 1) {
        fprintf(stderr, "err");
      }
    }
  } else {
    fprintf(stderr, "err");
  }
  return 0;
}
int opFile(int argc, char **argv, struct allFlags *flags, int count) {
  int i = 1;
  while (argv[i][0] == '-') {
    i++;
  }
  count = i;
  int err = 2;
  while (count < argc) {
    if (argv[count][0] != '-' && err != 0) {
      FILE *infile;
      infile = fopen(argv[count], "r");
      if (infile == NULL) {
        fprintf(stderr, "%s: %s: No such file or directory", argv[0],
                argv[count]);
        err = 0;
      } else {
        printFile(flags, infile);
        fclose(infile);
      }
    } else {
      fprintf(stderr, "cat: %s: No such file or directory\n", argv[count]);
    }
    count++;
  }
  return err;
}

void printFile(struct allFlags *flags, FILE *infile) {
  char lin = '\n';
  int sym;
  unsigned int buff_str = 0;
  int i = 1;
  while ((sym = fgetc(infile)) != EOF) {
    if ((flags->sFlag == 1 && sym == '\n') && (lin == '\n' || lin == '\0')) {
      buff_str++;
      if (buff_str > 1) {
        continue;
      }
    } else {
      buff_str = 0;
    }
    if ((flags->bFlag == 1 && sym != '\n' && lin == '\n') ||
        (flags->nFlag == 1 && lin == '\n' && flags->bFlag != 1)) {
      printf("%6d\t", i++);
    }
    if (flags->eFlag == 1 && sym == '\n') {
      putchar('$');
    }
    if (flags->tFlag == 1 && sym == '\t') {
      putchar('^');
      sym = 'I';
    }
    if (flags->vFlag == 1 && sym != '\n') {
      flag_v(&sym);
    }
    lin = sym;
    putchar(sym);
  }
}
int parser(char **argv, struct allFlags *flags) {
  int count = 1;
  while (argv[count][0] == '-') {
    if (argv[count][1] != '-') {
      //  for(int i = 0; i < strlen(argv[count]); i++ ) {
      //
      // }
      switch (argv[count][1]) {
        case 'b':
          flags->bFlag = 1;
          break;
        case 'e':
          flags->eFlag = 1;
          flags->vFlag = 1;
          break;
        case 'n':
          flags->nFlag = 1;
          break;
        case 's':
          flags->sFlag = 1;
          break;
        case 't':
          flags->tFlag = 1;
          flags->vFlag = 1;
          break;
        case 'v':
          flags->vFlag = 1;
          break;
        case 'T':
          flags->tFlag = 1;
          break;
        case 'E':
          flags->eFlag = 1;
          break;
        default:
          fprintf(stderr, "cat: illegal option --%s\n", argv[count]);
          count = 0;
          return count;
          break;
      }
    }
    if (argv[count][0] == '-' && argv[count][1] == '-') {
      if (strcmp(argv[count], "--number-nonblank") == 0) {
        flags->bFlag = 1;
      } else if (strcmp(argv[count], "--number") == 0) {
        flags->nFlag = 1;
      } else if (strcmp(argv[count], "--squeeze-blank") == 0) {
        flags->sFlag = 1;
      } else {
        printf("usage: cat [-benst] [file ...]\n");
        count = 0;
        return count;
      }
    }
    count++;
  }
  return count;
}

void flag_v(int *ch) {
  if (*ch >= 0 && *ch <= 31 && *ch != 9 && *ch != 10) {
    *ch += 64;
    printf("^");
  } else if (*ch == 127) {
    *ch -= 64;
    printf("^");
  }
}
