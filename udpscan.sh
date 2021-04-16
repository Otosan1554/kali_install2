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

nmap -n -Pn -sU -v --max-scan-delay 0.1 --max-retries 2 --version-intensity 0 -oN /root/Lab/$IP/UDP_Portscan.nmap $IP
a=""
for x in $(grep "/udp" /root/Lab/$IP/UDP_Portscan.nmap | cut -d "/" -f 1); do
	a=$a","$x
done
b=${a:1}
c="-p "$b

nmap -n -Pn -sUV -v $c -A --max-scan-delay 0.1 --max-retries 2 --version-intensity 0 -oN /root/Lab/$IP/UDP_sV.nmap $IP
