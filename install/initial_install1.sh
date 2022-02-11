#!/usr/bin/bash

read -p "メモリを追加しましたか？"
read -p "アンチウィルスを停止しましたか？"

echo "ソースリストの更新"
sudo apt -y update 

echo "chromeの導入"
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb

echo "geditの導入"
apt install gedit

read -p "kali/kaliにログインします"
read -p "sudo passwd root します"
read -p "キーボードに日本語を選択します"
read -p "右上のタイム表示を右クリックし、プロパティでタイムゾーンを変更します"
read -p "terminalの背景を白にします"
read -p "エディタ(mousepad)の背景を白にし、Favoriteに追加します"
read -p "エディタ(gedit)の背景を白にし、Favoriteに追加します"
read -p "FirefoxとChromeをFavoriteに追加します"
read -p "Settings>Power Manger>Securityタブからスクリーンセーバーを非有効化します"
read -p "smb.confのglobalセクションに client min protocol = core を追加します"
read -p "Firefoxのブラウザアドオンを導入します Foxy Proxy/Wappalyzer"
read -p "Burpの証明書をFirefoxに設定します"
read -p "Github、TryHackMeのログイン情報を登録します"
read -p "rootにログインします"

echo "seclistsの導入"
sudo apt-get install seclists

#echo "OpenVASのインストールと起動"
#apt install -y gvm 
#gvm-setup
#gvm-start

#echo "Discoverの導入"
#rm -r /home/kali/discover
#git clone https://github.com/leebaird/discover.git /home/kali/discover
#cd /home/kali/discover && ./update.sh
