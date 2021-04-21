#!/usr/bin/bash

read -p "IP > " IP
read -p "Exploit_name >" exploit_name

if [ -d /root/Lab/$IP/sandbox ]; then
	echo ""
else
	mkdir /root/Lab/$IP/sandbox
fi

filename=""

find /usr/share/exploitdb/ -name "$exploit_name"  | while read -r fname
do
  echo "$fname copied"
  cp $fname /root/Lab/$IP/sandbox
  cp $fname /root/www/privesc
  filename=$fname
done
