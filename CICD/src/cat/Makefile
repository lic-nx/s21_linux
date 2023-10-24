OPT = -std=c11 -Wall -Werror -Wextra
CI = gcc
CC = $(CI) $(OPT)

all :s21_cat 
	rm -rf *.o

s21_cat: s21_cat.o
	$(CC) s21_cat.o -o s21_cat

s21_cat.o: s21_cat.c 
	$(CC) -c $< -o $@

clean: 
	rm -rf *.o
	# rm -rf s21_cat
	rm -rf *.log

leaks: all
	leaks -atExit -- ./s21_cat

check: s21_cat
	clang-format -style=google --Werror -n *.c
	clang-format -style=google --Werror -n *.h


test: s21_cat test_func_cat.sh
	bash test_func_cat.sh	

rebuild:
	rm -rf *.o 
	rm s21_cat
	make
