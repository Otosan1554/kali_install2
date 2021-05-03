#!/usr/bin/bash

read -p "IP > " IP

flg1="0"
flg2="0"

while [ "$flg1" = "0" -o "$flg2" = "0" ]
do
   read -p  'Windows/Linux/Python? (w/l/p) >' input1

   echo '32bit:x86/i386/i686/IA-32' 
   echo '64bit:x64/x86_64/x86-64/AMD64/IA-64/Intel 64'
   read -p "32bit? (y/n)" input2
   read -p "Option ? > " input3


   if [ -z $input1 ] ; then
      echo "Input w/l/p? "
   elif [ $input1 = 'W' ] || [ $input1 = 'w' ] || [ $input1 = 'L' ]  || [ $input1 = 'l' ] || [ $input1 = 'P' ]  || [ $input1 = 'p' ] ; then
      flg1="1"
   fi
   if [ -z $input2 ] ; then
      echo "Input Y or N"
   elif [ $input2 = 'Y' ] || [ $input2 = 'y' ] || [ $input2 = 'N' ]  || [ $input2 = 'n' ] ; then
      flg2="1"
   fi
done

exploit_name="x"

while [ "$exploit_name" != "" ]
do
   ls /root/Lab/$IP/sandbox
   read -p "Exploit_name >" exploit_name
   rm /root/Lab/$IP/sandbox/$exploit_name.exe

   if [ "$input1" = "W" ] || [ "$input1" = "w" ] ; then
      if [ "$input2" = "Y" ] || [ "$input2" = "y" ] ; then
         echo "PE 32bit compile"
         i686-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
      else
         echo "PE 64bit compile"
         x86_64-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
      fi
   fi

   if [ "$input1" = "L" ] || [ "$input1" = "l" ] ; then
      if [ "$input2" = "Y" ] || [ "$input2" = "y" ] ; then
         echo "ELF 32bit compile"
         gcc -m32 /root/Lab/$IP/sandbox/$exploit_name $input3 -o /root/Lab/$IP/sandbox/$exploit_name.exe
      else
         echo "ELF 64bit compile"
         gcc /root/Lab/$IP/sandbox/$exploit_name $input3 -o /root/Lab/$IP/sandbox/$exploit_name.exe  
      fi
   fi

   if [ "$input1" = "L" ] || [ "$input1" = "l" ] || [ "$input1" = "W" ] || [ "$input1" = "w" ] ; then
      if [ -e /root/Lab/$IP/sandbox/$exploit_name.exe ]; then
         echo "Compile Completed"
         file /root/Lab/$IP/sandbox/$exploit_name.exe
         cp /root/Lab/$IP/sandbox/$exploit_name /root/www/privesc
         cp /root/Lab/$IP/sandbox/$exploit_name.exe /root/www/privesc
      else
         echo "Compile Error"
      fi
   elif [ "$input1" = "P" ] || [ "$input1" = "p" ] ; then
      echo "$exploit_name Copied "
      cp /root/Lab/$IP/sandbox/$exploit_name /root/www/privesc
   fi

done

flg3=0

while [ "$flg3" = "0" ]
do
   read -p "Start python web server? > " input2
   if [ -z $input2 ] ; then
      echo "Input Y or N"
   elif [ $input2 = 'Y' ] || [ $input2 = 'y' ] || [ $input2 = 'N' ]  || [ $input2 = 'n' ] ; then
      flg3="1"
   fi
done

if [ $input2 = 'Y' ] || [ $input2 = 'y' ] ; then
   read -p "What port? > " input3
   cd /root/www
   python3 -m http.server $input3
fi 


