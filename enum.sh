#!/usr/bin/bash
IP=$1
smbflag="o"

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

grep tcp /root/Lab/$IP/TCP_sV.nmap | grep open
grep udp /root/Lab/$IP/UDP_sV.nmap | grep open
proto="x"
port="x"

rm /root/Lab/$IP/tempshell.sh
touch /root/Lab/$IP/tempshell.sh
echo "#!/usr/bin/bash" > /root/Lab/$IP/tempshell.sh

rm /root/Lab/$IP/tempshell2.sh
touch /root/Lab/$IP/tempshell2.sh
echo "#!/usr/bin/bash" > /root/Lab/$IP/tempshell2.sh

rm /root/Lab/$IP/tempshell3.sh
touch /root/Lab/$IP/tempshell3.sh
echo "#!/usr/bin/bash" > /root/Lab/$IP/tempshell3.sh

input=""

while [ "$proto" != "" -a "port" != "" ]
do

   read -p "port= " port
   read -p "Protocol(mysql,ftp,nntp,pop3s,smtp,rdp,msrpc,ssh,smb,http,https,rpc,pop3,imap,imaps) > " proto

   if [ "$proto" = "MYSQL" -o "$proto" = "mysql" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(mysql* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_mysql_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "SIP" -o "$proto" = "sip" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,sip-enum-users,sip-methods"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_sip_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1="svwar -D -m INVITE -p "$port" "$IP
      echo $script1
      echo $script1 >> /root/Lab/$IP/tempshell.sh

   fi

   if [ "$proto" = "IMAPS" -o "$proto" = "imaps" ]; then
      script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_sslscan.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(imap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_imaps_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "POP3S" -o "$proto" = "pop3s" ]; then
      script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_sslscan.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(imap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_pop3s_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "IMAP" -o "$proto" = "imap" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(imap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_imap_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "POP3" -o "$proto" = "pop3" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(pop3* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_pop3_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "FTP" -o "$proto" = "ftp" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(ftp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_ftp_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

   fi

   if [ "$proto" = "NNTP" -o "$proto" = "nntp" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,nntp-ntlm-info" -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_nntp_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

   fi

   if [ "$proto" = "SMTP" -o "$proto" = "smtp" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(smtp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_smtp_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script='smtp-user-enum -M VRFY -U "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" -t '$IP" -p "$port' 2>&1 | tee "/root/Lab/'$IP"/Scan/tcp_"$port'_smtp_user-enum.txt"'
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "RDP" -o "$proto" = "rdp" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,(rdp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_rdp_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi


   if [ "$proto" = "MSRPC" -o "$proto" = "msrpc" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2='--script="banner,msrpc-enum,rpc-grind,rpcinfo"  -oN /root/Lab/'
      script3="$IP/Scan/tcp_"$port
      script4="_rpc_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "SSH" -o "$proto" = "ssh" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2="--script='banner,ssh2-enum-algos,ssh-hostkey,ssh-auth-methods' -oN /root/Lab/"
      script3="$IP/Scan/tcp_"$port
      script4="_ssh_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "SMB" -o "$proto" = "smb" ]; then
      if [ "port"= "137" ]; then
         script1="nmap -vv --reason -Pn -sU -sV -p $port "
         script2='--script="banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" --script-args="unsafe=1" -oN /root/Lab/'
         script3="$IP/Scan/udp_"$port
         script4="_smb_nmap.txt "$IP
         script=$script1$script2$script3$script4
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh
      else
         script1="nmap -vv --reason -Pn -sV -p $port "
         script2="--script='banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)' --script-args='unsafe=1' -oN /root/Lab/"
         script3="$IP/Scan/tcp_"$port
         script4="_smb_nmap.txt "$IP
         script=$script1$script2$script3$script4
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh
      fi

      script1="smbmap -H $IP -P $port 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-share-permissions.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1='smbmap -u null -p "" -H '$IP" -P "$port" 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-share-permissions.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1="smbmap -H $IP -P $port -R 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-list-contents.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1='smbmap -u null -p "" -H '$IP" -P "$port" -R 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-list-contents.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      echo "smbmap5"
      script1="smbmap -H "$IP" -P "$port' -x "ipconfig /all" 2>&1 | tee -a '
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-execute-command.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      echo "smbmap6"
      script1='smbmap -u null -p "" -H '$IP" -P "$port' -x "ipconfig /all" 2>&1 | tee -a '
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-execute-command.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      if [ "$smbflag" = "o" ]; then
         script1="nbtscan -rvh "$IP" 2>&1 | tee "
         script2='"/root/Lab/'$IP
         script3='/Scan/nbtscan.txt"'
         script=$script1$script2$script3
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh

         script1="enum4linux -a -M -l -d "$IP" 2>&1 | tee "
         script2='"/root/Lab/'$IP
         script3='/Scan/enum4linux.txt"'
         script=$script1$script2$script3
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh

         script1="smbclient -L \\ -N -I "$IP" 2>&1 | tee "
         script2='"/root/Lab/'$IP
         script3='/Scan/smbclient.txt"'
         script=$script1$script2$script3
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh

         smbflag="c"
      fi
   fi

   if [ "$proto" = "RPC" -o "$proto" = "rpc" ]; then
      script1='nmap -vv --reason -Pn -sV -p '$port' --script="banner,(rpcinfo or nfs*) and not (brute or broadcast or dos or external or fuzzer)" -oN '
      script2="/root/Lab/"$IP"/Scan/tcp_"$port"_nfs_nmap.txt "$IP
      script=$script1$script2
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1="showmount -e "$IP" 2>&1 | tee "
      script2='"/root/Lab/'$IP"/Scan/tcp_"$port'_showmount.txt"'
      script=$script1$script2
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh

      script1="nmap -vv --reason -Pn -sV -p "$port' --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN '
      script2="/root/Lab/"$IP"/Scan/tcp_"$port"_rpc_nmap.txt "$IP
      script=$script1$script2
      echo $script
      echo $script >> /root/Lab/$IP/tempshell.sh
   fi

   if [ "$proto" = "HTTP" -o "$proto" = "http" -o "$proto" = "HTTPS" -o "$proto" = "https" ]; then
      dddurl=""
      read -p "Additional URL? >  " addurl
      if [ "$addurl" = ""  ]; then
         script1="nmap -vv --reason -Pn -sV -p $port "
         script2="--script='(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)' -oN /root/Lab/"
         script3="$IP/Scan/tcp_"$port
         script4="_http_nmap.txt "$IP
         script=$script1$script2$script3$script4
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh

         script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
         script2='"/root/Lab/'$IP
         script3="/Scan/tcp_"$port
         script4='_sslscan.txt"'
         script=$script1$script2$script3$script4
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh
      
         script1="curl -sSik $proto://$IP:$port/robots.txt -m 10 2>&1 | sudo tee "
         script2='"/root/Lab/'$IP
         script3="/Scan/tcp_"$port
         script4='_http_robots.txt"'
         script=$script1$script2$script3$script4
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh

         script1="whatweb --color=never --no-errors -a 3 -v $proto://"$IP":"$port" 2>&1 | sudo tee "
         script2='"/root/Lab/'$IP
         script3="/Scan/tcp_"$port
         script4='_http_whatweb.txt"'
         script=$script1$script2$script3$script4
         echo $script
         echo $script >> /root/Lab/$IP/tempshell.sh
      fi

      if [ "$proto" = "HTTPS" -o "$proto" = "https" ]; then
         script1="nikto -ask=no -host $proto://$IP:$port"/"$addurl -ssl 2>&1 | sudo tee "
      else
         script1="nikto -ask=no -host $proto://$IP:$port"/"$addurl -nossl 2>&1 | sudo tee "      
      fi
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_http_nikto'$addurl'.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> /root/Lab/$IP/tempshell2.sh

      script1="dirb $proto://"$IP":"$port"/"$addurl
      script2=" /usr/share/seclists/Discovery/Web-Content/common.txt"
      script3=" -o /root/Lab/"$IP
      script4="/Scan/tcp_"$port
      script5='_http_dirb'$addurl'.txt'
      script=$script1$script2$script3$script4$script5
      echo $script
      echo $script >> /root/Lab/$IP/tempshell3.sh
   fi
done
sudo chmod 777 /root/Lab/$IP/tempshell.sh
/root/Lab/$IP/tempshell.sh &            

sudo chmod 777 /root/Lab/$IP/tempshell2.sh
/root/Lab/$IP/tempshell2.sh &           

sudo chmod 777 /root/Lab/$IP/tempshell3.sh
/root/Lab/$IP/tempshell3.sh &          

