#!/bin/bash

fotos=$(ls *.jpg)

for f in $fotos; do echo ${f/jpg/JPG}; done
