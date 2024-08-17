#!/bin/bash

for i in {5..30}
do
    for j in {5..30}
    do
        python3 digits.py features.txt  $i $j >> resultados.txt
        echo features $i $j ok
        #for k in {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1}
        for k in {1..20}
        do
          python3 knn2.py features.txt $k >> resultados.txt
          echo knn $k ok
        done  
    done
done