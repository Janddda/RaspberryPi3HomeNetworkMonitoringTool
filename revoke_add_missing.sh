#!/bin/bash

while [ true ]
do
if [ -s mac.txt ]
then
sshpass -p 'Asdf134679!@#$' scp mac.txt sovgarkutuk@192.168.1.1:/tmp/home/root
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

join -1 2 -2 1 -a 1 <(sort -k2 master.txt) <(sort name.txt) | awk '{print $2, $1, $3, $4, $5, $6, $7, $8, $9}' | sort > wn.txt #creates with names master file

sleep 4
done
