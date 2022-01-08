#!/usr/bin/bash

read -p "アンチウィルスを停止しましたか？"

echo "export PATH=$PATH:/root/tools" >> /root/.bashrc
echo "export PATH=$PATH:/root/tools" >> /root/.zshrc

echo "ソースリストの更新"
sudo apt -y update 

echo "Font 入れ替え"
sudo apt-get remove fonts-vlgothic
sudo apt-get install fonts-vlgothic

echo "geditの導入"
apt install gedit

echo "chromeの導入"
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb

echo "BackdoorFactoryの導入"
apt install backdoor-factory

echo "Metasploitの初期設定"
sudo systemctl start postgresql
echo "PostGreSQLの起動確認"
sudo msfdb init

echo "Searchsploitの更新"
sudo searchsploit -u

echo "Apacheをdisableにする"
sudo systemctl disable apache2

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

echo "Shelterのインストール"
sudo apt install shellter

read -p "いったん確認"

echo "sshサーバの自動起動設定"
sudo systemctl start ssh.service
sudo systemctl disable ssh

echo "niktoの導入"
apt install nikto

echo "pipの導入"
apt install python3-pip

echo "Autoreconの導入"
pip install git+https://github.com/Tib3rius/AutoRecon.git

read -p "いったん確認"

echo "exifの導入"
sudo apt install exif

echo "parseroの導入"
apt install parsero

read -p "いったん確認"

echo "Veilの導入"
apt install veil

echo "nishangの導入"
apt install nishang

echo "Powersploitの導入"
apt install powersploit

echo "gobusterの導入"
apt install gobuster

echo "ffufの導入"
apt install ffuf

echo "terminaorの導入"
apt install terminator

echo "straceの導入"
apt install strace

echo "smtp-user-enumの導入"
apt install smtp-user-enum

echo "default-mysql-clientの導入"
apt install default-mysql-client

echo "gimpの導入"
apt install gimp

echo "sipviciousの導入"
apt install sipvicious

echo "gunzip rockyou.txtを解凍します"
gunzip /usr/share/wordlists/rockyou.txt.gz

echo "smb.confのglobal セッティングに下記を追加してください"
echo "client min protocol = core"

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
