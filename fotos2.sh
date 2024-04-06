#!/bin/bash

fotos=$(ls *.jpg)

for f in $fotos; do cp $f ${f/figura/foto}; done

ls *jpg
