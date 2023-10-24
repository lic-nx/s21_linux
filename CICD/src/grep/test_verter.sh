# !/bin/bash

./s21_grep return test_1_grep.txt test_2_grep.txt > s21_grep.txt
grep return test_1_grep.txt test_2_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -i return test_1_grep.txt > s21_grep.txt
grep -i return test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -v s test_1_grep.txt > s21_grep.txt
grep -v s test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -c s test_1_grep.txt > s21_grep.txt
grep -c s test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -l s test_1_grep.txt test_2_grep.txt test_3_grep.txt > s21_grep.txt
grep -l s test_1_grep.txt test_2_grep.txt test_3_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -n s test_1_grep.txt > s21_grep.txt
grep -n s test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -o 123 test_1_grep.txt > s21_grep.txt
grep -o 123 test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -h return test_1_grep.txt test_2_grep.txt > s21_grep.txt
grep -h return test_1_grep.txt test_2_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep grep -s 123123 > s21_grep.txt
grep grep -s 123123 > s21_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -in return test_1_grep.txt > s21_grep.txt
grep -in return test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -cv s test_1_grep.txt > s21_grep.txt
grep -cv s test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -iv s test_1_grep.txt > s21_grep.txt
grep -iv s test_1_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -lv s test_1_grep.txt test_2_grep.txt test_3_grep.txt > s21_grep.txt
grep -lv s test_1_grep.txt test_2_grep.txt test_3_grep.txt > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -ho return test_1_grep.txt test_2_grep.txt > s21_grep.txt
grep -ho return test_1_grep.txt test_2_grep.txt > grep.txt 
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt
