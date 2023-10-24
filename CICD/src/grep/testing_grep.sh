#!/bin/bash

DIFF_RES=""
COUNTER_SUCCESS=0
COUNTER_FAIL=0

./s21_grep n test_grep.txt > s21_grep.txt
grep n test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "no flag SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
      
  else
    echo "$TEST1" >> log.txt
    (( COUNTER_FAIL++ ))
    echo "no flag SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -i "fOr" test_grep.txt > s21_grep.txt
grep -i "for" test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-i SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      "-i SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -e n test_2_grep.txt > s21_grep.txt
grep -e "n" test_2_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "e SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "e SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -e n test_grep.txt > s21_grep.txt
grep -e n test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "v SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
fi
rm s21_grep.txt grep.txt

./s21_grep -c n test_grep.txt > s21_grep.txt
grep -c n test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "c SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
fi
rm s21_grep.txt grep.txt

./s21_grep -l n test_grep.txt test_grep.txt test_grep.txt > s21_grep.txt
grep -l n test_grep.txt test_grep.txt test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "l SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
fi
rm s21_grep.txt grep.txt

./s21_grep -n n test_grep.txt > s21_grep.txt
grep -n n test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "n SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
fi
rm s21_grep.txt grep.txt

./s21_grep -h n test_grep.txt s21_grep.c > s21_grep.txt
grep -h n test_grep.txt s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "h SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
fi
rm s21_grep.txt grep.txt

./s21_grep -n test_grep.txt s21_grep.c > s21_grep.txt
grep -n test_grep.txt s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "n SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
fi
rm s21_grep.txt grep.txt

./s21_grep -s n test_grep.txt s21_grep.c > s21_grep.txt
grep -s n test_grep.txt s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "s SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "s SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -o n test_grep.txt > s21_grep.txt
grep -o n test_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "o SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "o SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt


./s21_grep f test_1_grep.txt s21_grep.c> s21_grep.txt
grep f test_0_grep.txt s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-f SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "-f SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep f test_1_grep.txt s21_grep.c> s21_grep.txt
grep f test_0_grep.txt s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-f SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "-f SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -iv Int s21_grep.c> s21_grep.txt
grep -iv Int s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-iv SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "-iv SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -in Int s21_grep.c> s21_grep.txt
grep -in Int s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-in SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "-in SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -ie Int s21_grep.c> s21_grep.txt
grep -ie Int s21_grep.c > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-ie SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "-ie SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt

./s21_grep -echar test_1_grep.txt test_2_grep.txt> s21_grep.txt
grep -echar test_1_grep.txt test_2_grep.txt > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
  then
    (( COUNTER_SUCCESS++ ))
      echo "-echar SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
  else
    echo "$TEST1" >> log.txt
      (( COUNTER_FAIL++ ))
      echo "-echar SUCCESS: $COUNTER_SUCCESS FAIL: $COUNTER_FAIL"
fi
rm s21_grep.txt grep.txt




echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"
echo "Nastya Molodec"
