#!/usr/bin/bash

read -p "IP > " IP
ls /root/Lab/$IP/sandbox

read -p "Exploit_name >" exploit_name

flg1="0"
flg2="0"

rm /root/Lab/$IP/sandbox/$exploit_name.exe

while [ "$flg1" = "0" -o "$flg2" = "0" ]
do
   read -p  'Windows? >' input1

   echo '32 bit?' 
   echo '32bit:x86/i386/i686/IA-32' 
   echo '64bit:x64/x86_64/x86-64/AMD64/IA-64/Intel 64'
   read input2

   if [ -z $input1 ] ; then
      echo "Input Y or N"
   elif [ $input1 = 'Y' ] || [ $input1 = 'y' ] || [ $input1 = 'N' ]  || [ $input1 = 'n' ] ; then
      flg1="1"
   fi
   if [ -z $input2 ] ; then
      echo "Input Y or N"
   elif [ $input2 = 'Y' ] || [ $input2 = 'y' ] || [ $input2 = 'N' ]  || [ $input2 = 'n' ] ; then
      flg2="1"
   fi
done

if [ "$input1" = "Y" ] || [ "$input1" = "y" ] ; then
  if [ "$input2" = "Y" ] || [ "$input2" = "y" ] ; then
    echo "PE 32bit compile"
    i686-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
  else
    echo "PE 64bit compile"
    x86_64-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
  fi
fi

if [ "$input1" = "N" ] || [ "$input1" = "n" ] ; then
  if [ "$input2" = "Y" ] || [ "$input2" = "y" ] ; then
    echo "ELF 32bit compile"
    gcc -m32 /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
  else
    echo "ELF 64bit compile"
    gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe  
  fi
fi

if [ -e /root/Lab/$IP/sandbox/$exploit_name.exe ]; then
   echo "Compile Completed"
   file /root/Lab/$IP/sandbox/$exploit_name.exe
else
   echo "Compile Error"
fi

flg1=0
flg2=0

while [ "$flg1" = "0" -o "$flg2" = "0" ]
do
   read -p "Server ni Upload? >" input1
   read -p "Start python web server? >" input2
   read -p "What port? >" input3
   if [ -z $input1 ] ; then
      echo "Input Y or N"
   elif [ $input1 = 'Y' ] || [ $input1 = 'y' ] || [ $input1 = 'N' ]  || [ $input1 = 'n' ] ; then
      flg1="1"
   fi
   if [ -z $input2 ] ; then
      echo "Input Y or N"
   elif [ $input2 = 'Y' ] || [ $input2 = 'y' ] || [ $input2 = 'N' ]  || [ $input2 = 'n' ] ; then
      flg2="1"
   fi
done

if [ $input1 = 'Y' ] || [ $input1 = 'y' ] ; then
   cp /root/Lab/$IP/sandbox/$exploit_name.exe /root/www/privesc
fi

if [ $input2 = 'Y' ] || [ $input2 = 'y' ] ; then
   cd /root/www
   python3 -m http.server $input3
fi 


