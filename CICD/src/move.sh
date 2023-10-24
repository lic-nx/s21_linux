#!/bin/bash
scp cat/s21_cat grep/s21_grep ch@172.24.116.8:/home/ch
ssh ch@172.24.116.8 mv s21_cat s21_grep /usr/local/bin 