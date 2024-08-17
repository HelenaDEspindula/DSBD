#!/bin/bash

for i in {5..25}
do
    for j in {5..25}
    do
        time python3 digits.py features.txt  $i $j >> resultados.txt
        echo features $i $j ok
        time python3 knn.py features.txt >> resultados.txt
        echo knn ok
    done
done