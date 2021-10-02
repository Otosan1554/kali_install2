#!/usr/bin/bash

mkdir /var/www/html/windows-script
mkdir /var/www/html/linux-script

echo "Linenumの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh  
chmod 777 LinEnum.sh

echo "LinPEASの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/linPEAS/linpeas.sh
chmod 777 linpeas.sh

echo "linux exoloit suggester 2の導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl
chmod 777 linux-exploit-suggester-2.pl

echo "Linux priv checkerの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py
chmod 777 linuxprivchecker.py

echo "Linux Smart Enumeration Toolの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh    
chmod 777 lse.sh

echo "Unix privesc checkerの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/pentestmonkey/unix-privesc-check/1_x/unix-privesc-check
mv unix-privesc-check unix-privesc-check.sh
chmod 777 unix-privesc-check.sh

echo "Linux Scriptの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/linux-script/script_linux.sh
chmod 777 script_linux.sh

echo "winPEASの導入"
cd /var/www/html/windows-script
wget https://github.com/carlospolop/PEASS-ng/blob/master/winPEAS/winPEASexe/binaries/x64/Release/winPEASx64.exe
wget https://github.com/carlospolop/PEASS-ng/blob/master/winPEAS/winPEASexe/binaries/x86/Release/winPEASx86.exe
wget https://github.com/carlospolop/PEASS-ng/blob/master/winPEAS/winPEASexe/binaries/Release/winPEASany.exe

echo "windows-privsesc-checkの導入"
cd /var/www/html/windows-script
wget https://github.com/pentestmonkey/windows-privesc-check/blob/master/windows-privesc-check2.exe

echo "JAWSの導入"
cd /var/www/html/windows-script
wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1

echo "var/www/html配下を作成"
cp -R /usr/share/windows-resources /var/www/html/windows-resources 
cp -R /usr/share/windows-binaries /var/www/html/windows-binaries 
cp -R /usr/share/webshells /var/www/html/webshells 
cp -R /usr/share/nishang /var/www/html/nishang
mv /root/kali_conf/webshell/* /var/www/html/webshells
mv /root/kali_conf/windows-binaries/Seatbelt.exe /var/www/html/windows/script
mv /root/kali_conf/windows-binaries/SharpUp.exe /var/www/html/windows/script
mv /root/kali_conf/windows-binaries/accesschk.exe /var/www/html/windows/script

echo "Powercatの導入"
sudo apt install powercat

echo "Powersploitの導入"
apt install powersploit


#################################### /privesc #########






echo "root/www配下を作成"
cp -R /usr/share/windows-resources /root/www/windows-resources 
cp -R /usr/share/windows-binaries /root/www/windows-binaries 
cp -R /usr/share/windows-privesc-check /root/www/windows-privesc-check 
cp -R /usr/share/webshells /root/www/webshells 
cp -R /usr/share/nishang /root/www/nishang
cp -R /usr/share/unix-privesc-check /root/www/unix-privesc-check 
mv /root/kali_conf/webshell/* /root/www/webshells
mv /root/kali_conf/script/* /root/www/script
cp /root/www/windows-resources/powersploit/Privesc/PowerUp.ps1 /root/www/script


echo "BeRootの導入"
cd /var/www/html/windows-script
wget https://github.com/AlessandroZ/BeRoot/blob/master/Linux/beroot.py
chmod 777 beroot.py

echo "Windows exoloit suggesterの導入"
cd /root/tools
git clone https://github.com/bitsadmin/wesng
