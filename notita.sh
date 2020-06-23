#!/bin/bash 
echo -e "Notita is a tool to extract list of IP addresses related to your target from their subdomains\n\n"
echo -e "Ceated by Harshit Dodia\n\n"
echo -e "Version :v0.1\n\n\n"

read -p"Enter the Domain name:" domain
wget $domain
cat index.html|grep -o '[A-Za-z0-9_\.-]*\.com'|cut -d'"' -f1|sort -u > index.txt
for url in $(cat index.txt);do host $url |grep "has address"|cut -d " " -f4;done > $domain.txt
rm index.html|rm index.txt
