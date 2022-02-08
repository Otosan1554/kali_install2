#!/usr/bin/bash

read -p "アンチウィルスを停止しましたか？"

echo "ソースリストの更新"
sudo apt -y update 

echo "seclistsの導入"
sudo apt-get install seclists

read -p "kali/kaliにログインします"
read -p "sudo passwd root します"
read -p "キーボードに日本語を選択します"
read -p "タイムゾーンを変更します"
read -p "terminalの背景を白にします(一般+root用)"
read -p "エディタ(mousepad)の背景を白にします"
read -p "スクリーンセーバーを非有効化します"
read -p "Github、TryHackMeのログイン情報を登録します"
read -p "smb.confのglobalセクションに client min protocol = core を追加します"
read -p "Firefoxのブラウザアドオンを導入します Web Developer/Tamper Data/Foxy Proxy/User Agent Switcher/Wappalyzer"
read -p "FoxyProxyを設定する"
read -p "Burpの証明書をFirefoxに設定します"
read -p "Github、TryHackMeのログイン情報を登録します"

read -p "root/rootにログインします"
read -p "キーボードに日本語を選択します"



#echo "OpenVASのインストールと起動"
#apt install -y gvm 
#gvm-setup
#gvm-start

#echo "Discoverの導入"
#rm -r /home/kali/discover
#git clone https://github.com/leebaird/discover.git /home/kali/discover
#cd /home/kali/discover && ./update.sh


