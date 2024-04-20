#!/bin/bash

if [ ! -f $1 ]; then
    echo Ошибка! Файл 1 не найден!
    exit 2
fi
if [ ! -f $2 ]; then
    echo Ошибка! Файл 2 не найден!
    exit 2
fi

if [ ! -r "$1" ]; then
    echo Ошибка! У вас нет прав доступа к файлу 1!
    exit 2
fi
if [ ! -r "$2" ]; then
    echo Ошибка! У вас нет прав доступа к файлу 2!
    exit 2
fi

file1=$(cat $1)
file2=$(cat $2)

file1_nums=''
for word in $file1; do
      echo $word
      if [[ "$word" =~ ^[-+]?[0-9]+$ ]]; then
          file1_nums="$file1_nums $word"
          echo file1_nums
      fi
done

file2_nums=''
for word in $file2; do
      echo $word
      if [[ "$word" =~ ^[-+]?[0-9]+$ ]]; then
          file2_nums="$file2_nums $word"
          echo file2_nums
      fi
done

if cmp -s "$file1_nums" "$file2_nums"; then
    echo Файлы совпадают
    exit 0
else
    echo Файлы не совпадают
    exit 1
fi



