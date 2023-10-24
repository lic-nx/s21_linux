#include "s21_grep.h"

int main(int argc, char *argv[]) {
  if (argc > 2) {
    allFlags flag = {0};
    char patterE[BUFF] = {0};
    char patterF[BUFF] = {0};
    parser(argc, argv, &flag, patterE, patterF);
  } else {
    fprintf(stderr, "Err");
  }
  return 0;
}

void parser(int argc, char *argv[], allFlags *flag, char *patternE,
            char *patternF) {
  int opt = 0, exception = 0;
  while ((opt = getopt_long(argc, argv, "e:ivclnhsf:o", NULL, NULL)) != -1) {
    switch (opt) {
      case 'e':
        flag->e = 1;
        strcat(patternE, optarg);
        strcat(patternE, "|");
        break;
      case 'i':
        flag->i = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'c':
        flag->c = 1;
        break;
      case 'l':
        flag->l = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 'o':
        flag->o = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 'h':
        flag->h = 1;
        break;
      case 'f':
        flag->f = 1;
        snprintf(patternF, BUFF, "%s", optarg);
        break;
      default:
        exception = -1;
        break;
    }
  }
  if (exception >= 0) {
    int counter = 0;
    if (flag->e) {
      for (int i = 0; patternE[i] != '\0'; i++) {
        counter++;
      }
      if (patternE[counter - 1] == '|') {
        patternE[counter - 1] = '\0';
      } else {
        patternE[counter] = '\0';
      }
    }
    grep(argc, argv, flag, patternE, patternF);
  }
}

void grep(int argc, char *argv[], allFlags *flag, char *patterE, char *buffer) {
  int patternF = 0;
  char pattern[BUFF] = {0};
  int file_counter = 0, count_file_state = 0;
  if (!flag->e && !flag->f) {
    snprintf(pattern, BUFF, "%s", argv[optind++]);
  }
  if (flag->f) {
    patternF = f_flag_handler(pattern, buffer);
    if (flag->e) {
      strcat(pattern, "|");
      strcat(pattern, patterE);
    }
  }
  if (flag->e && !flag->f) {
    snprintf(pattern, BUFF, "%s", patterE);
  }
  if (patternF != -1) {
    if (argc - optind > 1) {
      file_counter = 1;
    }
    for (int i = optind; i < argc; i++) {
      if (file_counter && !flag->h) {
        count_file_state = 1;
      }
      process_compiler(argv[i], flag, pattern, count_file_state);
    }
  }
}

int f_flag_handler(char *pattern, char *path) {
  FILE *fp;
  int exception = 0;
  int i = 0;
  int ch;
  if ((fp = fopen(path, "r")) != NULL) {
    while ((ch = fgetc(fp)) != EOF) {
      if (ch == '\n') {
        pattern[i++] = '|';
      }
      if (ch != 10 && ch != 13) {
        pattern[i++] = ch;
      }
    }
  } else {
    exception = -1;
  }
  if (pattern[i - 1] == '|') {
    pattern[i - 1] = '\0';
  }
  fclose(fp);
  return exception;
}

void file_reader(FILE *fp, allFlags *flag, regex_t reg, char *path,
                 int count_file_state) {
  char *word;
  int state = 0;
  char temp[BUFF] = {0};
  int coinc = 0, line_number = 1, match_count = 0;
  size_t nmatch = 1;
  regmatch_t pmatch[1];
  while (fgets(temp, sizeof(temp) - 1, fp) != NULL) {
    int match = 0;
    coinc = regexec(&reg, temp, nmatch, pmatch, 0);

    if (strchr(temp, '\n') == NULL) {
      strcat(temp, "\n");
    }
    if (coinc == 0 && !flag->v) {
      match = 1;
    }
    if (coinc == REG_NOMATCH && flag->v) {
      match = 1;
    }
    int is_path_enter = 0;
    if (match && flag->n && !flag->c && !flag->l) {
      if (count_file_state) {
        printf("%s:%d:", path, line_number);
        is_path_enter = 1;
      } else {
        printf("%d:", line_number);
      }
      state = 1;
    }
    if (match && !flag->o && !flag->c && !flag->l) {
      if (count_file_state && !is_path_enter) {
        printf("%s:%s", path, temp);
      } else {
        printf("%s", temp);
      }
    }
    if (match && flag->o && !flag->l && !flag->c) {
      if (flag->v) {
        if (count_file_state) {
          if (state) {
            printf("%s", temp);
          } else {
            printf("%s:%s", path, temp);
          }
        } else {
          printf("%s", temp);
        }
      }
      word = temp;
      while (coinc == 0) {
        if (count_file_state) {
          printf("%s:", path);
        }
        for (int i = pmatch[0].rm_so; i < pmatch[0].rm_eo; i++) {
          printf("%c", word[i]);
        }
        printf("\n");
        int count = 0;
        while (count != pmatch[0].rm_eo) {
          word++;
          count++;
        }
        coinc = regexec(&reg, word, nmatch, pmatch, 0);
      }
    }
    match_count += match;
    line_number++;
  }
  int is_only_c = 0;
  if (flag->c && (!flag->v && !flag->l && !flag->o && !flag->e && !flag->n &&
                  !flag->h && !flag->i)) {
    is_only_c = 1;
  }
  if (!is_only_c) {
    if (!count_file_state && flag->h && flag->l && (flag->c && !flag->o) &&
        match_count > 1) {
      match_count = 1;
    }
    if (flag->n && flag->l && (flag->c && !flag->o) && match_count > 1) {
      match_count = 1;
    }
    if (flag->v && flag->l && (flag->c && !flag->o) && match_count > 1) {
      match_count = 1;
    }
    if (flag->c && match_count > 1 && !flag->v && !flag->h && !flag->n) {
      match_count = 1;
    }
  }

  if (flag->c) {
    count_file_state ? printf("%s:%d\n", path, match_count)
                     : printf("%d\n", match_count);
  }
  if (flag->l && match_count > 0) {
    printf("%s\n", path);
  }
}

void process_compiler(char *path, allFlags *flag, char *pattern,
                      int count_file_state) {
  regex_t reg;
  FILE *fp;
  int cflags = REG_EXTENDED;
  if (flag->i) {
    cflags = REG_ICASE;
  }
  if ((fp = fopen(path, "r")) != NULL) {
    regcomp(&reg, pattern, cflags);
    file_reader(fp, flag, reg, path, count_file_state);
    regfree(&reg);
    fclose(fp);
  } else if (!flag->s) {
    fprintf(stderr, "grep: %s: No such file or directory\n", path);
  }
}
