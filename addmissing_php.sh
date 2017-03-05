#!/bin/bash

while [ true ]
do
if [ -s add.txt ]
then
addmac=$(<add.txt)
cat missing.txt | grep $addmac >> master.txt
`sed "/\$addmac/d" missing.txt > missing.new`
`mv missing.new missing.txt`
rm -fr add.txt
touch add.txt
chmod 777 add.txt 
fi
done
