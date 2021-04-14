#!/usr/bin/bash

read -p "アンチウィルスを停止しましたか？"

mkdir /root/tools
mkdir /root/www

mv /root/kali_conf/cplc.sh /root/tools
mv /root/kali_conf/vulnscan.sh /root/tools
mv /root/kali_conf/tcpscan.sh /root/tools
mv /root/kali_conf/udpscan.sh /root/tools
mv /root/kali_conf/mount.sh /root/tools
mv /root/kali_conf/srccopy.sh /root/tools

echo "export PATH=$PATH:/root/tools" >> /root/.bashrc
echo "export PATH=$PATH:/root/tools" >> /root/.zshrc

echo "ソースリストの更新"
sudo apt -y update 

echo "Font 入れ替え"
sudo apt-get remove fonts-vlgothic
sudo apt-get install fonts-vlgothic

echo "geditの導入"
apt install gedit

echo "BackdoorFactoryの導入"
apt install backdoor-factory

echo "Metasploitの初期設定"
sudo systemctl start postgresql
echo "PostGreSQLの起動確認"
sudo msfdb init

echo "Searchsploitの更新"
sudo searchsploit -u

#echo "ApacheをEnableにする"
#sudo systemctl enable apache2

echo "VNC Viewerのインストール"
sudo apt-get install tigervnc-viewer

echo "Crowberのインストール"
sudo apt install crowbar

read -p "いったん確認"

echo "mingw　64の導入"
sudo apt install mingw-w64
sudo apt-get install gcc-multilib 

echo "ポート転送ツールの導入"
sudo apt install rinetd

echo "Powercatの導入"
sudo apt install powercat

echo "Empireの導入"
apt install empire

echo "Shelterのインストール"
sudo apt install shellter

read -p "いったん確認"

echo "sshサーバの自動起動設定"
sudo systemctl start ssh.service
sudo systemctl enable ssh

echo "niktoの導入"
apt install nikto

echo "pipの導入"
apt install python3-pip

echo "Autoreconの導入"
pip install git+https://github.com/Tib3rius/AutoRecon.git

echo "onetwopunchの導入"
rm /root/onetwopunch.sh
cd /root
git clone https://github.com/superkojiman/onetwopunch
cp /root/onetwopunch/onetwopunch.sh /root/tools/onetwopunch.sh
rm -r /root/onetwopunch
sudo chmod 777 /root/tools/onetwopunch.sh

read -p "いったん確認"

echo "windows-privsesc-checkの導入"
rm -r /usr/share/windows-privesc-check
cd /usr/share
git clone https://github.com/pentestmonkey/windows-privesc-check.git

echo "exifの導入"
sudo apt install exif

echo "bruteforce-http-authの導入"
cd /root/tools
git clone https://github.com/erforschr/bruteforce-http-auth.git
cd bruteforce-http-auth
python3 -m pip install -r requirements.txt

echo "parseroの導入"
apt install parsero

echo "Heartbleed exploitの導入"
cd /root/tools
git clone https://github.com/sensepost/heartbleed-poc.git

read -p "いったん確認"

echo "SMBexecの導入"
rm -r /root/tools/smbexec
git clone https://github.com/brav0hax/smbexec.git /root/tools/smbexec
cd smbexec
./install.sh

echo "Veilの導入"
apt install veil

echo "nishangの導入"
apt install nishang

echo "CMSmapの導入"
rm -r /root/tools/CMSmap
cd /root/tools
git clone https://github.com/Dionach/CMSmap

echo "Powersploitの導入"
apt install powersploit

echo "Apache配下を作成"
mkdir /var/www2/html/
cp -R /usr/share/windows-resources /root/www/windows-resources 
cp -R /usr/share/windows-binaries /root/www/windows-binaries 
cp -R /usr/share/windows-privesc-check /root/www/windows-privesc-check 
cp -R /usr/share/webshells /root/www/webshells 
cp -R /usr/share/nishang /root/www/nishang 
cp -R /usr/share/unix-privesc-check /root/www/unix-privesc-check 


echo "Easy-Pの導入"
cd /root/tools
rm -r /root/tools/Easy-P
git clone https://github.com/cheetz/Easy-P.git /root/tools/Easy-P

echo "gobusterの導入"
apt install gobuster

echo "ffufの導入"
apt install ffuf

echo "terminaorの導入"
apt install terminator

echo "次のブラウザアドオンを導入します"
echo "Web Developerアドオン"
echo "Tamper Data"
echo "Foxy Proxy"
echo "User Agent Switcher"
echo "Wappalyzer"

#echo "Discoverの導入"
#rm -r /home/kali/discover
#git clone https://github.com/leebaird/discover.git /home/kali/discover
#cd /home/kali/discover && ./update.sh

#echo "OpenVASのインストールと起動"
#apt install -y gvm 
#gvm-setup
#gvm-start


