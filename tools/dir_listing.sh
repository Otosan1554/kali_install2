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

rm /tmp/dirbuster_$IP/url_level$level_new'_temp'
rm /tmp/dirbuster_$IP/wordlist_level$level_new
rm /tmp/dirbuster_$IP/not_found_level$level_new
rm /tmp/dirbuster_$IP/url_level$level_new

touch /tmp/dirbuster_$IP/wordlist_level$level_new
touch /tmp/dirbuster_$IP/not_found_level$level_new
touch /tmp/dirbuster_$IP/url_level$level_new

sort -u /tmp/dirbuster_$IP/url_level$level

count=1
sousu=$(cat /tmp/dirbuster_$IP/url_level$level | wc -l)

for url in $(cat /tmp/dirbuster_$IP/url_level$level)
do
   len=${#url}
   if [ ${url:$len-1:1} != '/' ]; then
      url=$url/
   fi
   echo "<<<   Start Level$level $count/$sousu  $url'FUZZ'   >>>"
   count=$((count += 1))
   ffuf -s -w /tmp/dirbuster_$IP/common.txt -mc 200,204,301,302,307,401,403,405 -t 40 -e .htm,.shtml,.php,.html,.js,.txt,.zip,.bak,.asp,.aspx,.xml -u  $url'FUZZ' > /tmp/dirbuster_$IP/url_level$level_new'_temp'
   for url1 in $(cat /tmp/dirbuster_$IP/url_level$level_new'_temp')
   do
      flg='n'
      if [ $url1 = 'manual' ]; then
         read -p 'Skip manual ? > ' flg
      fi
      if [ $flg = 'n' -o $flg = 'N' ]; then 
         echo $url1 > /tmp/dirbuster_$IP/dirb_wordlist_temp
         cat /tmp/dirbuster_$IP/dirb_wordlist_temp
         dirb  $url /tmp/dirbuster_$IP/dirb_wordlist_temp > /tmp/dirbuster_$IP/dirb_result_temp
         hantei1=$(cat /tmp/dirbuster_$IP/dirb_result_temp | grep -i 'LISTABLE' | wc -l)
         hantei2=$(cat /tmp/dirbuster_$IP/dirb_result_temp | grep -i 'directory' | wc -l)
         hantei3=$(cat /tmp/dirbuster_$IP/dirb_result_temp | grep -i 'CODE:' | wc -l)
         if [ $hantei1 != 0 -o $hantei2 != 0 -o $hantei3 != 0 ]; then
            echo $url1 >> /tmp/dirbuster_$IP/wordlist_level$level_new
            if [ $hantei1 = 0 -a $hantei2 != 0 ]; then
#            if [ $hantei1 != 0 -o $hantei2 != 0 ]; then
               echo $url$url1 >> /tmp/dirbuster_$IP/url_level$level_new
            fi
         else
            echo $url$url1 >> /tmp/dirbuster_$IP/not_found_level$level_new
         fi
      fi
   done
done

rm /tmp/dirbuster_$IP/url_level$level_new'_temp'
rm /tmp/dirbuster_$IP/dirb_wordlist_temp
rm /tmp/dirbuster_$IP/dirb_result_temp

}

url_m=$1

protocol=$(echo $url_m | cut -d "/" -f 1 | cut -d ":" -f 1)
IP_m=$(echo $url_m | cut -d "/" -f 3 | cut -d ":" -f 1 )
port=$(echo $url_m | cut -d "/" -f 3 | cut -d ":" -f 2 )
addurl=$(echo $url_m | cut -d "/" -f 4)

echo "protocol: " $protocol
echo "IP Address: " $IP_m
echo "port: " $port
echo "Addurl: "$addurl

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

if [ -d /tmp/dirbuster_$IP_m ]; then
   echo ""
else
   mkdir /tmp/dirbuster_$IP_m
fi

echo "<------------------- Robots.txt ------------------------->"
curl $protocol://$IP_m/$port/robots.txt
echo "<------------------- Robots.txt ------------------------->"

cp /usr/share/seclists/Discovery/Web-Content/common.txt /tmp/dirbuster_$IP_m/common.txt 

entry='x'
while [ "$entry" != "" ]
do
   read -p 'Search String Entry Add ? > ' entry
   if [ "$entry" != "" ]; then
      echo entry >> /tmp/dirbuster_$IP_m/common.txt
   fi
done

# saigo ga / de owatteru?

len_m=${#url_m}
if [ ${url_m:$len_m-1:1} != '/' ]; then
   url_m=$url_m/
fi

echo $url_m > /tmp/dirbuster_$IP_m/url_level0

rm /root/Lab/$IP_m/dirbuster/wordlist_temp

wlistgen $IP_m 0
cat /tmp/dirbuster_$IP_m/wordlist_level1 > /tmp/dirbuster_$IP_m/wordlist_temp
wlistgen $IP_m 1
cat /tmp/dirbuster_$IP_m/wordlist_level2 >> /tmp/dirbuster_$IP_m/wordlist_temp
wlistgen $IP_m 2
cat /tmp/dirbuster_$IP_m/wordlist_level3 >> /tmp/dirbuster_$IP_m/wordlist_temp
wlistgen $IP_m 3
cat /tmp/dirbuster_$IP_m/wordlist_level4 >> /tmp/dirbuster_$IP_m/wordlist_temp
wlistgen $IP_m 4
cat /tmp/dirbuster_$IP_m/wordlist_level5 >> /tmp/dirbuster_$IP_m/wordlist_temp


rm /tmp/dirbuster_$IP_m/tcp_$port'_'$protocol'_dirb'$addurl'.txt'

sort -u /tmp/dirbuster_$IP_m/wordlist_temp

dirb $url_m /tmp/dirbuster_$IP_m/wordlist_temp -o /tmp/dirbuster_$IP_m/tcp_$port'_'$protocol'_dirb'$addurl'.txt'

rm -R /root/Lab/$IP_m/dirbuster_$IP_m
cp -R /tmp/dirbuster_$IP_m/ /root/Lab/$IP_m/dirbuster_$IP_m

rm /tmp/dirbuster_$IP_m/wordlist_temp
