#!/usr/bin/bash

read -p "アンチウィルスを停止しましたか？"

echo "ソースリストの更新"
sudo apt -y update 

echo "seclistsの導入"
sudo apt-get install seclists

echo "OpenVASのインストールと起動"
apt install -y gvm 
gvm-setup
gvm-start

#echo "Discoverの導入"
#rm -r /home/kali/discover
#git clone https://github.com/leebaird/discover.git /home/kali/discover
#cd /home/kali/discover && ./update.sh


