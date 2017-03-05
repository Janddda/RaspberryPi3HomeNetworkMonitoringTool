#!/bin/bash

for i in "${@}"
do 
cat master.txt | grep  $i >> revoked.txt
done

