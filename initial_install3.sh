#!/usr/bin/bash

mkdir /root/tools
mkdir /var/www/html/windows
mkdir /var/www/html/linux

echo "Powercatの導入"
sudo apt install powercat

echo "windows-privsesc-checkの導入"
rm -r /usr/share/windows-privesc-check
cd /usr/share
git clone https://github.com/pentestmonkey/windows-privesc-check.git

echo "Powersploitの導入"
apt install powersploit

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

echo "LinPEAS/winPEASの導入"
cd /tmp
rm -R /tmp/privilege-escalation-awesome-scripts-suite/
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/
cp /tmp/privilege-escalation-awesome-scripts-suite/linPEAS/linpeas.sh /root/www/script

chmod 777 /root/www/script/linpeas.sh

cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASbat/winPEAS.bat /root/www/script
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/x64/Release/winPEASx64.exe  /root/www/script
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/x86/Release/winPEASx86.exe  /root/www/script
cp /tmp/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/Release/winPEASany.exe  /root/www/script

echo "Linux Smart Enumeration Toolの導入"
cd /root/www/script
wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh    
chmod 777 lse.sh

echo "Linenumの導入"
cd /root/www/script
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh  
chmod 777 lse.sh

echo "Linux priv checkerの導入"
cd /root/www/script
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py
chmod 777 linuxprivchecker.py

echo "BeRootの導入"
cd /root/www/script
wget https://github.com/AlessandroZ/BeRoot/blob/master/Linux/beroot.py
chmod 777 beroot.py

echo "linux exoloit suggester 2の導入"
cd /root/www/script
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl
chmod 777 linux-exploit-suggester-2.pl

echo "Windows exoloit suggesterの導入"
cd /root/tools
git clone https://github.com/bitsadmin/wesng

echo "JAWSの導入"
cd /tmp
git clone https://github.com/411Hall/JAWS
cp /tmp/JAWS/jaws-enum.ps1 /root/www/script

echo "Unix privesc checkerの導入"
cd /root/www/script
wget http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz
tar -zxvf unix-privesc-check-1.4.tar.gz
cp /root/www/script/unix-privesc-check-1.4/unix-privesc-check /root/www/script
mv /root/www/script/unix-privesc-check /root/www/script/unix-privesc-check.sh
chmod 777 /root/www/script/unix-privesc-check.sh
rm -R /root/www/script/unix-privesc-check-1.4/
rm unix-privesc-check/unix-privesc-check-1.4.tar.gz

