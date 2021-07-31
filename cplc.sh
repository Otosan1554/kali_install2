#!/usr/bin/bash

read -p "IP > " IP

if [ -d /var/www/html/$IP ]; then
   echo ""
else
   mkdir /var/www/html/$IP
fi

exploit_name="x"

while [ "$exploit_name" != "" ]
do
   ls -la /root/Lab/$IP/sandbox/*.c
   read -p "Exploit_name >" exploit_name
   rm /root/Lab/$IP/sandbox/$exploit_name.exe
   rm /root/Lab/$IP/sandbox/$exploit_name.out
   rm /root/Lab/$IP/sandbox/$exploit_name.err

   flg1="0"
   flg2="0"

   while [ "$flg1" = "0" -o "$flg2" = "0" ]
   do
      read -p  'Windows/Linux/Python? (win/lin/py) >' input1

      echo '32bit:x86/i386/i686/IA-32' 
      echo '64bit:x64/x86_64/x86-64/AMD64/IA-64/Intel 64'
      read -p "32bit/64bit? (32/64)" input2
      read -p "Option ? > " input3


      if [ -z $input1 ] ; then
         echo "Input win/lin/py? "
      elif [ $input1 = 'win' ] || [ $input1 = 'lin' ] || [ $input1 = 'py' ] ; then
         flg1="1"
      fi
      if [ -z $input2 ] ; then
         echo "Input 32 or 64"
      elif [ $input2 = '32' ] || [ $input2 = '64' ] ; then
         flg2="1"
      fi
   done
   
   if [ "$input1" = "win" ] ; then
      if [ "$input2" = "32" ] ; then
         echo "PE 32bit compile"
         i686-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
      else
         echo "PE 64bit compile"
         x86_64-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
      fi
   fi

   if [ "$input1" = "lin" ] ; then
      if [ "$input2" = "32" ] ; then
         echo "ELF 32bit compile"
         gcc -m32 /root/Lab/$IP/sandbox/$exploit_name $input3 -o /root/Lab/$IP/sandbox/$exploit_name.out
      else
         echo "ELF 64bit compile"
         gcc /root/Lab/$IP/sandbox/$exploit_name $input3 -o /root/Lab/$IP/sandbox/$exploit_name.out  
      fi
   fi

   if [ "$input1" = "lin" ] ; then
      if [ -e /root/Lab/$IP/sandbox/$exploit_name.out ]; then
         echo "Compile Completed"
         file /root/Lab/$IP/sandbox/$exploit_name.out
         cp /root/Lab/$IP/sandbox/$exploit_name /var/www/html/$IP
         cp /root/Lab/$IP/sandbox/$exploit_name.out /var/www/html/$IP
      else
         echo "Compile Error"
         touch /root/Lab/$IP/sandbox/$exploit_name.err
      fi
   fi

   if [ "$input1" = "win" ] ; then
      if [ -e /root/Lab/$IP/sandbox/$exploit_name.exe ]; then
         echo "Compile Completed"
         file /root/Lab/$IP/sandbox/$exploit_name.exe
         cp /root/Lab/$IP/sandbox/$exploit_name /var/www/html/$IP
         cp /root/Lab/$IP/sandbox/$exploit_name.exe /var/www/html/$IP
      else
         echo "Compile Error"
         touch /root/Lab/$IP/sandbox/$exploit_name.err
      fi
   fi

   if [ "$input1" = "py" ] ; then
      echo "$exploit_name Copied "
      cp /root/Lab/$IP/sandbox/$exploit_name /var/www/html/$IP
   fi

done

flg3=0

while [ "$flg3" = "0" ]
do
   read -p "Start python web server? > " input2
   if [ -z $input2 ] ; then
      echo "Input y or n"
   elif [ $input2 = 'y' ] || [ $input2 = 'n' ] ; then
      flg3="1"
   fi
done

if [ $input2 = 'y' ] ; then
   read -p "What port? > " input3
   cd /var/www/html/$IP
   python3 -m http.server $input3
fi 


