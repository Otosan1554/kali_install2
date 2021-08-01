#!/usr/bin/bash

mkdir /var/www/html/windows/script
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
rm -r /usr/share/windows-privesc-check
cd /usr/share
git clone https://github.com/pentestmonkey/windows-privesc-check.git

echo "root/www配下を作成"
cp -R /usr/share/windows-resources /root/www/windows-resources 
cp -R /usr/share/windows-binaries /root/www/windows-binaries 
cp -R /usr/share/windows-privesc-check /root/www/windows-privesc-check 
cp -R /usr/share/webshells /root/www/webshells 
cp -R /usr/share/nishang /root/www/nishang
mv /root/kali_conf/webshell/* /root/www/webshells
mv /root/kali_conf/script/* /root/www/script
cp /root/www/windows-resources/powersploit/Privesc/PowerUp.ps1 /root/www/script

echo "LinPEAS/winPEASの導入"
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASbat/winPEAS.bat /root/www/script
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/x64/Release/winPEASx64.exe  /root/www/script
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/x86/Release/winPEASx86.exe  /root/www/script
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/Release/winPEASany.exe  /root/www/script

echo "BeRootの導入"
cd /root/www/script
wget https://github.com/AlessandroZ/BeRoot/blob/master/Linux/beroot.py
chmod 777 beroot.py

echo "Windows exoloit suggesterの導入"
cd /root/tools
git clone https://github.com/bitsadmin/wesng

echo "JAWSの導入"
cd /tmp
git clone https://github.com/411Hall/JAWS
cp /tmp/JAWS/jaws-enum.ps1 /root/www/script



echo "Powercatの導入"
sudo apt install powercat

echo "Powersploitの導入"
apt install powersploit
