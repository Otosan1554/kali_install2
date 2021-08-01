#!/usr/bin/bash

mkdir /var/www/html/windows/
mkdir /var/www/html/windows/script
mkdir /var/www/html/linux/
mkdir /var/www/html/linux/script

echo "Linenumの導入"
cd /var/www/html/linux/script
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh  
chmod 777 LinEnum.sh

echo "LinPEASの導入"
cd /var/www/html/linux/script
wget https://github.com/carlospolop/PEASS-ng/blob/master/linPEAS/linpeas.sh
chmod 777 linpeas.sh

echo "linux exoloit suggester 2の導入"
cd /var/www/html/linux/script
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl
chmod 777 linux-exploit-suggester-2.pl

echo "Linux priv checkerの導入"
cd /var/www/html/linux/script
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py
chmod 777 linuxprivchecker.py

echo "Linux Smart Enumeration Toolの導入"
cd /var/www/html/linux/script
wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh    
chmod 777 lse.sh

echo "Unix privesc checkerの導入"
cd /var/www/html/linux/script
wget https://github.com/pentestmonkey/unix-privesc-check/blob/1_x/unix-privesc-check
mv unix-privesc-check unix-privesc-check.sh
chmod 777 /root/www/script/unix-privesc-check.sh

echo "windows-privsesc-checkの導入"
cd /var/www/html/windows/script
wget https://github.com/pentestmonkey/windows-privesc-check/blob/master/windows-privesc-check2.exe

echo "winPEASの導入"
cd /var/www/html/windows/script
wget https://github.com/carlospolop/PEASS-ng/blob/master/winPEAS/winPEASexe/binaries/x64/Release/winPEASx64.exe
wget https://github.com/carlospolop/PEASS-ng/blob/master/winPEAS/winPEASexe/binaries/x86/Release/winPEASx86.exe
wget https://github.com/carlospolop/PEASS-ng/blob/master/winPEAS/winPEASbat/winPEAS.bat

echo "Windows exoloit suggesterの導入"
cd /root/tools
git clone https://github.com/bitsadmin/wesng

echo "JAWSの導入"
cd /var/www/html/windows/script
wget https://github.com/411Hall/JAWS/blob/master/jaws-enum.ps1

echo "root/www配下を作成"
cp -R /usr/share/windows-resources /var/www/html/windows-resources 
cp -R /usr/share/windows-binaries /var/www/html/windows-binaries 
cp -R /usr/share/webshells /root/www/webshells 
cp -R /usr/share/nishang /root/www/nishang
mv /root/kali_conf/webshell/* /root/www/webshells
mv /root/kali_conf/windows-binaries/Seatbelt.exe /var/www/html/windows/script
mv /root/kali_conf/windows-binaries/SharpUp.exe /var/www/html/windows/script
mv /root/kali_conf/windows-binaries/accesschk.exe /var/www/html/windows/script

echo "Powercatの導入"
sudo apt install powercat

echo "Powersploitの導入"
apt install powersploit
