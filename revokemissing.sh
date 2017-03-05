#!/bin/bash
for i in "${@}"
do 
cat missing.txt | grep  $i >> revoked.txt
echo $i >> mac.txt
done

