#!/usr/bin/bash

read -p "アンチウィルスを停止しましたか？"

echo "export PATH=$PATH:/root/tools" >> /root/.bashrc
echo "export PATH=$PATH:/root/tools" >> /root/.zshrc

echo "ソースリストの更新"
sudo apt -y update 

echo "Font 入れ替え"
sudo apt-get remove fonts-vlgothic
sudo apt-get install fonts-vlgothic

echo "kazamの導入"
apt install kazam

echo "httpieの導入"
apt install httpie

#echo "davtestの導入"
#apt install davtest

#echo "cadaverの導入"
#apt install cadaver

#echo "crackmapexecの導入"
#apt install crackmapexec

#echo "evil-winrmの導入"
#apt install evil-winrm

echo "pure-ftpdの導入"
apt -y install pure-ftpd
useradd ftp
mkdir /home/ftp
echo "no" > /etc/pure-ftpd/conf/NoAnonymous
echo "no" > /etc/pure-ftpd/conf/PAMAuthentication
#systemctl start pure-ftpd

#echo "xfreedpの導入"
#apt install freerdp2-x11 freerdp2-shadow-x11

echo "Metasploitの初期設定"
sudo systemctl start postgresql
echo "PostGreSQLの起動確認"
sudo msfdb init

echo "Searchsploitの更新"
sudo searchsploit -u

echo "Apacheをdisableにする"
sudo systemctl disable apache2

#echo "VNC Viewerのインストール"
#sudo apt-get install tigervnc-viewer

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

#echo "niktoの導入"
#apt install nikto

echo "Autoreconの導入"
pip3 install git+https://github.com/Tib3rius/AutoRecon.git

read -p "いったん確認"

echo "exifの導入"
sudo apt install exif

read -p "いったん確認"

echo "Veilの導入"
apt install veil

echo "nishangの導入"
apt install nishang

#echo "Powersploitの導入"
#apt install powersploit

echo "gobusterの導入"
apt install gobuster

#echo "ffufの導入"
#apt install ffuf

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

echo "ZAPの導入"
apt -y install zaproxy

echo "gunzip rockyou.txtを解凍します"
gunzip /usr/share/wordlists/rockyou.txt.gz

#echo "seclistsの導入"
#sudo apt-get install seclists
