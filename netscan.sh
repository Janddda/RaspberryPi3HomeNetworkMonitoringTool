#!/bin/bash

while [ true ]
do
ip="192.168.1.*"  #ip address
email="" #email address 
rescan="15s" #runs every X minutes ex: 10m 
exclude=`ifconfig eth0 | grep broadcast | awk '{print $2}'`
cat missing.txt > missing_old.txt
rm -fr missing.txt
nmap -sn $ip -exclude $exclude | grep "MAC\|192" |  awk '{if($1=="MAC")print $3,$4,$5,$6,$7,$8,$9,$10;else if($5~/192/)print $5; else if($1=="Nmap" && $6~/192/)print $6}'| tr -d '()' | awk '{$1 = $1",";print;} '  >>temp.txt
awk '{ORS=NR%2?" ":"\n";print}' temp.txt > temp1.txt #holds new nmap scan
cat temp1.txt | awk '{print $2}' > dup.txt #prints mac address to check duplicate
sort dup.txt | uniq -d > dup2.txt #finds the spoofed address
sed 's/.$//' dup2.txt > dup3.txt #makes spoofed list
if [ -s dup3.txt ]
then 
cat dup3.txt | mail -s "Spoofed MAC Address" $email #email spoofed
fi
if [ -s temp1.txt ] #if someone is on the network
then 
if [ -s master.txt ] #if master is not empty
then
echo "master is not empty" 
awk 'FNR==NR{a[$2];next};!($2 in a)' master.txt temp1.txt >> temp2.txt #separates what is new from what exists in master
awk 'NR==FNR{c[$2]++;next};c[$2] > 0' master.txt temp1.txt > temp4.txt #separates what is now ONLINE in master
awk 'FNR==NR{a[$2];next};!($2 in a)' temp1.txt master.txt >> temp88.txt #separates what is now OFFLINE in master
cat temp4.txt > master.txt #makes part of the master
cat temp88.txt | awk '{if($1!="OFFLINE,")print "OFFLINE, " $2, $3,", " $1}' | sed 's/.$//' >> temp89.txt #gets new OFFLINE
cat temp88.txt | awk '{if($1=="OFFLINE,")print $1, $2, $3, $4, $5}'  >> temp90.txt #gets old OFFLINE
cat temp89.txt temp90.txt >> master.txt #adding OFFLINE
#join -1 2 -2 1 -a 1 <(sort -k2 master.txt) <(sort name.txt) | awk '{print $2, $1, $3, $4, $5, $6, $7, $8, $9}' | sort > wn.txt #creates with names master file
if [ -s revoked.txt ] #if revoked is not empty
then
awk 'FNR==NR{a[$2];next};!($2 in a)' revoked.txt temp2.txt > temp3.txt #get what is not in revoked
awk 'NR==FNR{c[$2]++;next};c[$2] > 0' revoked.txt temp1.txt > revokedusersonline.txt #revoked online users
mv temp3.txt missing.txt #make what is not in revoked the missing
awk 'FNR==NR{a[$2];next};!($2 in a)' missing_old.txt missing.txt > missingnew.txt #makes a file to see if anything new in the missing
if [ -s revokedusersonline.txt ] #if there are revoked online users
then 
cat revokedusersonline.txt | mail -s "Revoked Users Back Online" $email #email that revoked users are back online
echo revokedusersonline
fi
if [[ ( -s missing.txt && ! -s missing_old.txt ) || ( -s missingnew.txt ) ]] #if missing is not empty
then
cat missing.txt | mail -s "Missing Devices" $email #email the missing
echo ddd
fi
else
cat temp2.txt >> missing.txt #if revoked was empty we come here and make temp2 the new missing
awk 'FNR==NR{a[$2];next};!($2 in a)' missing_old.txt missing.txt > missingnew.txt #makes a file to see if anything new in the missing
if [[ ( -s missing.txt && ! -s missing_old.txt ) || ( -s missingnew.txt ) ]] #if missing is not empty
then
cat missing.txt | mail -s "Missing Devices" $email #email the missing
echo eee
fi
fi

else # we came here because master is empty
echo master is empty
if [ -s revoked.txt ] #check to see if revoked is not empty
then
awk 'FNR==NR{a[$2];next};!($2 in a)' revoked.txt temp2.txt > temp3.txt #get what is not in revoked
awk 'NR==FNR{c[$2]++;next};c[$2] > 0' revoked.txt temp1.txt > revokedusersonline.txt #revoked users online
mv temp3.txt missing.txt #make what is not in revoked the missing 
awk 'FNR==NR{a[$2];next};!($2 in a)' missing_old.txt missing.txt > missingnew.txt #makes a file to see if anything new in the missing
if [ -s revokedusersonline.txt ] #checks to see if there are revoked online users
then 
cat revokedusersonline.txt | mail -s "Revoked Users Back Online" $email #email that revoked users are back online
echo revokedusersonline
fi
if  [[ ( -s missing.txt && ! -s missing_old.txt ) || ( -s missingnew.txt ) ]]  #if missing is not empty
then
cat missing.txt | mail -s "Missing Devices" $email #email the missing
echo fff
fi
else
cat temp1.txt >> missing.txt #if revoked was empty we come here and make temp2 the new missing
awk 'FNR==NR{a[$2];next};!($2 in a)' missing_old.txt missing.txt > missingnew.txt #makes a file to see if anything new in the missing
if  [[ ( -s missing.txt && ! -s missing_old.txt ) || ( -s missingnew.txt ) ]]  #if missing is not empty
then
cat missing.txt | mail -s "Missing Devices" $email #email the missing
echo ggg
fi
fi
fi

else #we come here because temp1 is empty meaning no devices on the network
if [ -s master.txt] #master is empty
then
mv master.txt temp88.txt #since no one is on the network we turn everything in master to OFFLINE
cat temp88.txt | awk '{if($1!="OFFLINE,")print "OFFLINE, " $2, $3,", " $1}' | sed 's/.$//' >> temp89.txt #gets new OFFLINE
cat temp88.txt | awk '{if($1=="OFFLINE,")print $1, $2, $3, $4, $5}'  >> temp90.txt #gets old OFFLINE
cat temp89.txt temp90.txt >> master.txt #adding OFFLINE
#join -1 2 -2 1 -a 1 <(sort -k2 master.txt) <(sort name.txt) | awk '{print $2, $1, $3, $4, $5, $6, $7, $8, $9}' | sort > wn.txt #creates with names master file
fi
fi

rm -fr temp*
sleep $rescan

done
