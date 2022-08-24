#!/usr/bin/bash

read -p "デフォルトのブラウザをFirefoxにする"

echo "linux-scriptディレクトリの作成"
rm -R /var/www/html/linux-script
mkdir /var/www/html/linux-script

echo "Linenumの導入"
cd /var/www/html/linux-script
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh  
chmod 777 LinEnum.sh

echo "LinPEASの導入"
read -p "次のページからlinpeasをダウンロードします(複数)"
xdg-open https://github.com/carlospolop/PEASS-ng/releases/tag/refs/pull/260/merge
read -p "mv /root/Downloads/winPEAS* /var/www/html/windows-script/"
mv /root/Downloads/linpeas* /var/www/html/linux-script/
chmod 777 /var/www/html/linux-script/linpeas*

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

echo "windows-scriptディレクトリの作成"
rm -R /var/www/html/windows-script
mkdir /var/www/html/windows-script

echo "winPEAS（winPEASx64.exe/winPEASx86.exe/winPEASany.exe）を導入します"
read -p "次のページからwinPEASをダウンロードします（複数）"
#read -p "xdg-open https://github.com/carlospolop/PEASS-ng/releases/tag/refs/pull/260/merge"
xdg-open https://github.com/carlospolop/PEASS-ng/releases/tag/refs/pull/260/merge
read -p "mv /root/Downloads/winPEAS* /var/www/html/windows-script/"
mv /root/Downloads/winPEAS* /var/www/html/windows-script/

echo "windows-privsesc-checkを導入します"
read -p "次のページからwindows-privesc-check2.exeをダウンロードします"
#read -p "xdg-open https://github.com/pentestmonkey/windows-privesc-check/blob/master/windows-privesc-check2.exe"
xdg-open https://github.com/pentestmonkey/windows-privesc-check/blob/master/windows-privesc-check2.exe
read -p "mv /root/Downloads/windows-privesc-check2.exe /var/www/html/windows-script/"
mv /root/Downloads/windows-privesc-check2.exe /var/www/html/windows-script/

echo "Seatbelt.exeの導入"
read -p "次のページからSeatbelt.exeをダウンロードします"
#read -p "xdg-open https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/Seatbelt.exe"
xdg-open https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/Seatbelt.exe
read -p "mv /root/Downloads/Seatbelt.exe /var/www/html/windows-script/"
mv /root/Downloads/Seatbelt.exe /var/www/html/windows-script/

echo "SharpUp.exeの導入"
read -p "次のページからSharpUp.exeをダウンロードします"
#read -p "xdg-open https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/SharpUp.exe"
xdg-open https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/SharpUp.exe
read -p "mv /root/Downloads/SharpUp.exe /var/www/html/windows-script/"
mv /root/Downloads/SharpUp.exe /var/www/html/windows-script/

echo "accesschk.exeの導入"
read -p "次のページからAccessChkをダウンロードします"
#read -p "xdg-open https://docs.microsoft.com/en-us/sysinternals/downloads/accesschk"
xdg-open https://docs.microsoft.com/en-us/sysinternals/downloads/accesschk
read -p "cd /root/Downloads; unzip /root/Downloads/AccessChk.zip"
read -p "mv /root/Downloads/accesschk* /var/www/html/windows-script/"
cd /root/Downloads; unzip /root/Downloads/AccessChk.zip
mv /root/Downloads/accesschk* /var/www/html/windows-script/

echo "Autoruns.exeの導入"
read -p "次のページからAutorunsをダウンロードします"
xdg-open https://docs.microsoft.com/ja-jp/sysinternals/downloads/autoruns
read -p "cd /root/Downloads; unzip /root/Downloads/Autoruns.zip"
read -p "mv /root/Downloads/autoruns* /var/www/html/windows-script/"
read -p "mv /root/Downloads/Autoruns* /var/www/html/windows-script/"
cd /root/Downloads; unzip /root/Downloads/Autoruns.zip
mv /root/Downloads/autoruns* /var/www/html/windows-script/
mv /root/Downloads/Autoruns* /var/www/html/windows-script/

echo "Powerless.batの導入"
read -p "次のページからPowerless.batをダウンロードします"
#read -p "xdg-open https://github.com/gladiatx0r/Powerless"
xdg-open https://github.com/gladiatx0r/Powerless
read -p "mv /root/Downloads/Powerless.bat /var/www/html/windows-script/"
mv /root/Downloads/Powerless.bat /var/www/html/windows-script/

echo "script_windows.batの導入"
cd /var/www/html/windows-script
rm script_windows.bat
wget https://github.com/Otosan1554/kali_conf/blob/main/windows-script/script_windows.bat

echo "hijackdll.cの導入"
cd /var/www/html/windows-script
rm hijackdll.c
wget https://github.com/Otosan1554/kali_conf/blob/main/windows-script/hijackdll.c

echo "JAWSの導入"
cd /var/www/html/windows-script
wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1

echo "var/www/html配下を作成"

rm -R /var/www/html/windows-resources
cp -R /usr/share/windows-resources /var/www/html/windows-resources 
cp /var/www/html/windows-resources/powersploit/Privesc/PowerUp.ps1 /var/www/html/windows-script

rm -R /var/www/html/windows-binaries
cp -R /usr/share/windows-binaries /var/www/html/windows-binaries 

rm -R /var/www/html/webshells
cp -R /usr/share/webshells /var/www/html/webshells 

rm -R /var/www/html/nishang
cp -R /usr/share/nishang /var/www/html/nishang

cd /var/www/html/webshells
rm backdoor.php
rm php_webshell_examples

wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/webshell/backdoor.php
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/webshell/php_webshell_examples

cd /tmp
git clone https://github.com/Dewalt-arch/pimpmykali.git
cd pimpmykali
chmod 777 pimpmykali.sh
read -p "select N, Y, Y, Y"
./pimpmykali.sh




echo "次のブラウザアドオンを導入します"
echo "Web Developerアドオン"
echo "Tamper Data"
echo "Foxy Proxy"
echo "User Agent Switcher"
echo "Wappalyzer"
echo "builtwith"

