#!/usr/bin/bash

read -p "IP > " IP

if [ -d /root/Lab/$IP/sandbox ]; then
	echo ""
else
	mkdir /root/Lab/$IP/sandbox
fi

if [ -d /var/www/html/$IP ]; then
	echo ""
else
	mkdir /var/www/html/$IP
fi

exploit_name="x"

while [ "$exploit_name" != "" ]
do
   read -p "exploit_name > " exploit_name

   find /usr/share/exploitdb/ -name "$exploit_name"  | while read -r fname
   do
      echo "$fname copied"
      cp $fname /root/Lab/$IP/sandbox
      cp $fname /var/www/html/$IP
   done

done
