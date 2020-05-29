@echo off
echo.
:: set variable for working folder
set workDIR="%HOMEDRIVE%\automation"
:: enter the working directory for future commands
cd workDIR
:: download file from my github and run
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/Final/Scripts/clean_windows_apps.ps1"
echo. "Cleaning Windows Apps..."
timeout /t 5 /nobreak >nul
start /b /wait powershell.exe -file %workDIR%\clean_windows_apps.ps1
::start /b /wait cmd /C "C:\clean_windows_apps.cmd"
echo.
echo.
:: download file from my github and run
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/Final/Scripts/runAutomation.ps1"
echo.
echo.
echo. "Automating install..."
timeout /t 5 /nobreak >nul
start /b /wait powershell.exe -file %workDIR%\runAutomation.ps1
::start /b /wait cmd /C "& ""C:\runAutomation.ps1"""
echo.
echo.
echo.
echo "Finished automation. Cleaning up..."
del /f /q %workDIR%\clean_windows_apps.ps1
del /f /q %workDIR%\runAutomation.ps1
timeout /t 5 /nobreak >nul
del /s /q %0 >nul
exit