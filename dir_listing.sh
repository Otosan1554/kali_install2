#!/usr/bin/bash

wlistgen ()
{
IP=$1
level=$2

if [ $level = '0' ] ; then
   level_new='1'
elif [ $level = '1' ] ; then
   level_new='2'
elif [ $level = '2' ] ; then
   level_new='3'
elif [ $level = '3' ] ; then
   level_new='4'
elif [ $level = '4' ] ; then
   level_new='5'
else
   echo ""
fi

rm /root/Lab/$IP/dirbuster/url_level$level_new'_temp'
rm /root/Lab/$IP/dirbuster/wordlist_level$level_new
rm /root/Lab/$IP/dirbuster/not_found_level$level_new
rm /root/Lab/$IP/dirbuster/url_level$level_new

touch /root/Lab/$IP/dirbuster/wordlist_level$level_new
touch /root/Lab/$IP/dirbuster/not_found_level$level_new
touch /root/Lab/$IP/dirbuster/url_level$level_new

sort -u /root/Lab/$IP/dirbuster/url_level$level

count=1
sousu=$(cat /root/Lab/$IP/dirbuster/url_level$level | wc -l)

for url in $(cat /root/Lab/$IP/dirbuster/url_level$level)
do
   len=${#url}
   if [ ${url:$len-1:1} != '/' ]; then
      url=$url/
   fi
   echo "<<<   Start Level$level $count/$sousu  $url'FUZZ'   >>>"
   count=$((count += 1))
   ffuf -s -w /root/Lab/$IP_m/dirbuster/common.txt -mc 200,204,301,302,307,401,403,405 -t 40 -u  $url'FUZZ' > /root/Lab/$IP/dirbuster/url_level$level_new'_temp'
   for url1 in $(cat /root/Lab/$IP/dirbuster/url_level$level_new'_temp')
   do
      flg='n'
      if [ $url1 = 'manual' ]; then
         read -p 'Skip manual ? > ' flg
      fi
      if [ $flg = 'n' -o $flg = 'N' ]; then 
         echo $url1 > /root/Lab/$IP/dirbuster/dirb_wordlist_temp
         cat /root/Lab/$IP/dirbuster/dirb_wordlist_temp
         dirb  $url /root/Lab/$IP/dirbuster/dirb_wordlist_temp > /root/Lab/$IP/dirbuster/dirb_result_temp
         hantei1=$(cat /root/Lab/$IP/dirbuster/dirb_result_temp | grep -i 'LISTABLE' | wc -l)
         hantei2=$(cat /root/Lab/$IP/dirbuster/dirb_result_temp | grep -i 'directory' | wc -l)
         hantei3=$(cat /root/Lab/$IP/dirbuster/dirb_result_temp | grep -i 'CODE:' | wc -l)
         if [ $hantei1 != 0 -o $hantei2 != 0 -o $hantei3 != 0 ]; then
            echo $url1 >> /root/Lab/$IP/dirbuster/wordlist_level$level_new
            if [ $hantei1 = 0 -a $hantei2 != 0 ]; then
#            if [ $hantei1 != 0 -o $hantei2 != 0 ]; then
               echo $url$url1 >> /root/Lab/$IP/dirbuster/url_level$level_new
            fi
         else
            echo $url$url1 >> /root/Lab/$IP/dirbuster/not_found_level$level_new
         fi
      fi
   done
done

rm /root/Lab/$IP/dirbuster/url_level$level_new'_temp'
rm /root/Lab/$IP/dirbuster/dirb_wordlist_temp
rm /root/Lab/$IP/dirbuster/dirb_result_temp

}

url_m=$1

protocol=$(echo $url_m | cut -d "/" -f 1 | cut -d ":" -f 1)
IP_m=$(echo $url_m | cut -d "/" -f 3 | cut -d ":" -f 1 )
port=$(echo $url_m | cut -d "/" -f 3 | cut -d ":" -f 2 )
addurl=$(echo $url_m | cut -d "/" -f 4)

echo $protocol
echo $IP_m
echo $port
echo $addurl

if [ ${url_m:0:7} = 'http://' ] ; then
   echo ""
elif [ ${url_m:0:8} = 'https://' ] ; then
   echo ""
else
   echo "PROTOCOL ERROR"
   exit
fi

if expr "$IP_m" : '[0-9.]*' > /dev/null ; then
   echo ""
else
   echo "IP ADDRESS ERROR"
   exit
fi

if expr "$port" : '[0-9]*' > /dev/null ; then
   if [ $IP_m = $port ]; then
      echo "PORT ERROR"
      exit
   fi
else
   echo "PORT ERROR"
   exit
fi

if [ -d /root/Lab/$IP_m/dirbuster ]; then
   echo ""
else
   mkdir /root/Lab/$IP_m/dirbuster
fi

curl $protocol://$IP_m/$port/robots.txt

cp /usr/share/seclists/Discovery/Web-Content/common.txt /root/Lab/$IP_m/dirbuster/common.txt 

entry='x'
while [ "$entry" != "" ]
do
   read -p 'Entry Add ? > ' entry
   if [ "$entry" != "" ]; then
      echo entry >> /root/Lab/$IP_m/dirbuster/common.txt
   fi
done

len_m=${#url_m}
if [ ${url_m:$len_m-1:1} != '/' ]; then
   url_m=$url_m/
fi

echo $url_m > /root/Lab/$IP_m/dirbuster/url_level0

rm /root/Lab/$IP/dirbuster/wordlist_temp

wlistgen $IP_m 0
cat /root/Lab/$IP_m/dirbuster/wordlist_level1 > /root/Lab/$IP_m/dirbuster/wordlist_temp
wlistgen $IP_m 1
cat /root/Lab/$IP_m/dirbuster/wordlist_level2 >> /root/Lab/$IP_m/dirbuster/wordlist_temp
wlistgen $IP_m 2
cat /root/Lab/$IP_m/dirbuster/wordlist_level3 >> /root/Lab/$IP_m/dirbuster/wordlist_temp
wlistgen $IP_m 3
cat /root/Lab/$IP_m/dirbuster/wordlist_level4 >> /root/Lab/$IP_m/dirbuster/wordlist_temp
wlistgen $IP_m 4
cat /root/Lab/$IP_m/dirbuster/wordlist_level5 >> /root/Lab/$IP_m/dirbuster/wordlist_temp


rm /root/Lab/$IP_m/Scan/dirb/Scan/tcp_$port'_'$protocol'_dirb'$addurl'.txt'

sort -u /root/Lab/$IP_m/dirbuster/wordlist_temp

dirb $url_m /root/Lab/$IP_m/dirbuster/wordlist_temp -o /root/Lab/$IP_m/Scan/tcp_$port'_'$protocol'_dirb'$addurl'.txt'

rm /root/Lab/$IP_m/dirbuster/wordlist_temp


