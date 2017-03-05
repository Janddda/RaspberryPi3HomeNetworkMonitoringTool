#!/bin/bash

for i in "${@}"
do 
cat missing.txt | grep  $i >> master.txt
done

