#!/usr/bin/bash
IP=$1
smbflag=0

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

rm -R /root/Lab/$IP/Scan/
mkdir /root/Lab/$IP/Scan

grep tcp /root/Lab/$IP/TCP_sV.nmap | grep open
grep udp /root/Lab/$IP/UDP_sV.nmap | grep open

rm tempshell.sh
touch tempshell.sh
echo "#!/usr/bin/bash" > tempshell.sh

read -p "port= " port
read -p "Protocol= " proto

while [ "$proto" != "" -a "port" != "" ]
do

   if [ "$proto" = "SSH" -o "$proto" = "ssh" ]; then

      script1="nmap -vv --reason -Pn -sV -p $port "
      script2="--script='banner,ssh2-enum-algos,ssh-hostkey,ssh-auth-methods' -oN /root/Lab/"
      script3="$IP/Scan/tcp_"$port
      script4="_ssh_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> tempshell.sh

      script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_sslscan.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >>tempshell.sh
   fi


   if [ "$proto" = "SMB" -o "$proto" = "smb" ]; then

      script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_sslscan.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >>tempshell.sh

      script1="nmap -vv --reason -Pn -sU -sV -p $port "
      script2="--script='banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)' --script-args='unsafe=1'-oN /root/Lab/"
      script3="$IP/Scan/udp_"$port
      script4="_smb_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> tempshell.sh

      script1="smbmap -H $IP -P $port 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-share-permissions.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> tempshell.sh

      script1='smbmap -u null -p "" -H '$IP" -P "$port" 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-share-permissions.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> tempshell.sh

      script1="smbmap -H $IP -P $port -R 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-list-contents.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> tempshell.sh

      script1='smbmap -u null -p "" -H '$IP" -P "$port" -R 2>&1 | tee -a "
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-list-contents.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> tempshell.sh

      echo "smbmap5"
      script1="smbmap -H "$IP" -P "$port' -x "ipconfig /all" 2>&1 | tee -a '
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-execute-command.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> tempshell.sh

      echo "smbmap6"
      script1='smbmap -u null -p "" -H '$IP" -P "$port' -x "ipconfig /all" 2>&1 | tee -a '
      script2='"/root/Lab/'$IP
      script3='/Scan/smbmap-execute-command.txt"'
      script=$script1$script2$script3
      echo $script
      echo $script >> tempshell.sh

      if [ "smbflag" = 0 ]; then
         script1="nbtscan -rvh "$IP" 2>&1 | tee "
         script2='"/root/Lab/'$IP
         script3='/Scan/nbtscan.txt"'
         script=$script1$script2$script3
         echo $script
         echo $script >> tempshell.sh

         script1="enum4linux -a -M -l -d "$IP" 2>&1 | tee "
         script2='"/root/Lab/'$IP
         script3='/Scan/enum4linux.txt"'
         script=$script1$script2$script3
         echo $script
         echo $script >> tempshell.sh

         script1="smbclient -L\\ -N -I"$IP" 2>&1 | tee "
         script2='"/root/Lab/'$IP
         script3='/Scan/smbclient.txt"'
         script=$script1$script2$script3
         echo $script
         echo $script >> tempshell.sh

         smbflag=1
      fi
   fi

   if [ "$proto" = "HTTP" -o "$proto" = "http" ]; then
      script1="nmap -vv --reason -Pn -sV -p $port "
      script2="--script='(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)' -oN /root/Lab/"
      script3="$IP/Scan/tcp_"$port
      script4="_http_nmap.txt "$IP
      script=$script1$script2$script3$script4
      echo $script
      echo $script >> tempshell.sh

      script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_sslscan.txt"'
      script=$script1$script2$script3$port$script4
      echo $script
      echo $script >>tempshell.sh
      
      script1="curl -sSik http://$IP:$port/robots.txt -m 10 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_http_robots.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >>tempshell.sh

      script1="whatweb --color=never --no-errors -a 3 -v http://"$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_http_whatweb.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >>tempshell.sh

      script1="nikto -ask=no -h http://"$IP":"$port" 2>&1 | sudo tee "
      script2='"/root/Lab/'$IP
      script3="/Scan/tcp_"$port
      script4='_http_nikto.txt"'
      script=$script1$script2$script3$script4
      echo $script
      echo $script >>tempshell.sh

      script1="ffuf -u http://"$IP":"$port
      script2="/FUZZ -t 10 -w /usr/share/seclists/Discovery/Web-Content/common.txt -e "
      script3='".txt,.html,.php,.asp,.aspx,.jsp" -v -of csv -o "/root/Lab/'$IP
      script4="/Scan/tcp_"$port
      script5='_http_ffuf.txt"'
      script=$script1$script2$script3$script4$script5
      echo $script
      echo $script >>tempshell.sh
   fi
   read -p "port= " port
   read -p "Protocol= " proto
done
sudo chmod 777 tempshell.sh
./tempshell.sh            


