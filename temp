#!/usr/bin/bash

echo "tools directory make or update"

if [ -d /root/tools ]; then
   echo ""
else
   mkdir /root/tools
fi

cd fir /root/tools

wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/cplc.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/enum.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/srccopy.sh

mkdir /root/tools
mkdir /root/www
mkdir /root/www/privesc
mkdir /root/www/script
mkdir /root/www/revshell


mv /root/kali_conf/cplc.sh /root/tools
mv /root/kali_conf/vulnscan.sh /root/tools
mv /root/kali_conf/tcpscan.sh /root/tools
mv /root/kali_conf/udpscan.sh /root/tools
mv /root/kali_conf/mount.sh /root/tools
mv /root/kali_conf/srccopy.sh /root/tools
mv /root/kali_conf/reverse_shellgen.sh /root/tools


#################################### /root/tools #########

echo "Empireの導入"
cd /root/tools
git clone https://github.com/EmpireProject/Empire.git
apt-get install libssl-dev swig python3-dev gcc
cd /Empire/setup
./install.sh

echo "Windows exoloit suggesterの導入"
cd /root/tools
git clone https://github.com/bitsadmin/wesng

echo "onetwopunchの導入"
rm /root/onetwopunch.sh
cd /root
git clone https://github.com/superkojiman/onetwopunch
cp /root/onetwopunch/onetwopunch.sh /root/tools/onetwopunch.sh
rm -r /root/onetwopunch
sudo chmod 777 /root/tools/onetwopunch.sh

echo "bruteforce-http-authの導入"
cd /root/tools
git clone https://github.com/erforschr/bruteforce-http-auth.git
cd bruteforce-http-auth
python3 -m pip install -r requirements.txt

echo "Heartbleed exploitの導入"
cd /root/tools
git clone https://github.com/sensepost/heartbleed-poc.git

echo "SMBexecの導入"
rm -r /root/tools/smbexec
git clone https://github.com/brav0hax/smbexec.git /root/tools/smbexec
cd smbexec
./install.sh

echo "CMSmapの導入"
rm -r /root/tools/CMSmap
cd /root/tools
git clone https://github.com/Dionach/CMSmap


echo "Easy-Pの導入"
cd /root/tools
rm -r /root/tools/Easy-P
git clone https://github.com/cheetz/Easy-P.git /root/tools/Easy-P
