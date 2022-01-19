#!/usr/bin/bash

echo "tools directory make or update"

if [ -d /root/tools ]; then
   echo ""
else
   mkdir /root/tools
fi

cd /root/tools

rm cplc.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/cplc.sh
chmod 777 cplc.sh

rm dir_listing.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/dir_listing.sh
chmod 777 dir_listing.sh

rm enum.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/enum.sh
chmod 777 enum.sh

rm hydra.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/hydra.sh
chmod 777 hydra.sh

rm mount.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/mount.sh
chmod 777 mount.sh

rm reverse_shellgen.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/reverse_shellgen.sh
chmod 777 reverse_shellgen.sh

rm srccopy.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/srccopy.sh
chmod 777 srccopy.sh

rm tcpscan.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/tcpscan.sh
chmod 777 tcpscan.sh

rm udpscan.sh
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/udpscan.sh
chmod 777 udpscan.sh

rm memo
wget https://raw.githubusercontent.com/Otosan1554/kali_conf/main/tools/memo

#echo "BeRootの導入"
#cd /var/www/html/windows-script
#wget https://github.com/AlessandroZ/BeRoot/blob/master/Linux/beroot.py
#chmod 777 beroot.py

echo "Empireの導入"
cd /root/tools
rm -R Empire
git clone https://github.com/EmpireProject/Empire.git
apt-get install libssl-dev swig python3-dev gcc
cd /Empire/setup
./install.sh

echo "Windows exoloit suggesterの導入"
cd /root/tools
rm -R wesng
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
rm -R bruteforce-http-auth
git clone https://github.com/erforschr/bruteforce-http-auth.git
cd bruteforce-http-auth
python3 -m pip install -r requirements.txt

echo "Heartbleed exploitの導入"
cd /root/tools
rm -R heartbleed-poc
git clone https://github.com/sensepost/heartbleed-poc.git

# echo "SMBexecの導入"
# rm -R /root/tools/smbexec
# git clone https://github.com/brav0hax/smbexec.git /root/tools/smbexec
# cd smbexec
# ./install.sh

echo "CMSmapの導入"
rm -R /root/tools/CMSmap
cd /root/tools
git clone https://github.com/Dionach/CMSmap

echo "Easy-Pの導入"
cd /root/tools
rm -R /root/tools/Easy-P
git clone https://github.com/cheetz/Easy-P.git /root/tools/Easy-P

echo "hash-id.pyの導入"
cd /root/tools
wget https://gitlab.com/kalilinux/packages/hash-identifier/-/raw/kali/master/hash-id.py
