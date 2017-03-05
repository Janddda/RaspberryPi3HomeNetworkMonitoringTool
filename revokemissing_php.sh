#!/bin/bash

while [ true ]
do
if [ -s mac.txt ]
then
sshpass -p 'ENTER PASSWORD HERE' scp mac.txt ENTER USERNAME HERE@ROUTER' S IP:/tmp/home/root
rm -fr mac.txt
touch mac.txt
chmod 777 mac.txt 
fi

if [ -s mac2.txt ]
then
revokemac=$(<mac2.txt)
cat missing.txt | grep $revokemac >> revoked.txt
`sed "/\$revokemac/d" missing.txt > missing.new`
`mv missing.new missing.txt`
rm -fr mac2.txt
touch mac2.txt
chmod 777 mac2.txt 
fi

done
