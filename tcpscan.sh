#!/usr/bin/bash
IP=$1

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

if [ -d /root/Lab/ ]; then
	echo ""
else
	mkdir /root/Lab/
fi

if [ -d /root/Lab/$IP ]; then
	echo ""
else
	mkdir /root/Lab/$IP
fi

rm -R /root/Lab/$IP/Scan
mkdir /root/Lab/$IP/Scan

nmap -n -vv --reason -Pn --osscan-guess -sS -p- -v -T 4 -oN /root/Lab/$IP/TCP_Portscan.nmap $IP
a=""
for x in $(grep "/tcp" /root/Lab/$IP/TCP_Portscan.nmap | cut -d "/" -f 1); do
	a=$a","$x
done
b=${a:1}
c="-p "$b

nmap -n -Pn -sV -vv $c -T 4 -sC -oN /root/Lab/$IP/TCP_sV.nmap $IP
