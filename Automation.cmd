@echo off
echo.
set workDIR="%HOMEDRIVE%\automation"
echo. "Cleaning Windows Apps..."
cd workDIR
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/Powershell%20Scripts/clean_windows_apps.ps1"
start /b /wait powershell.exe -file %workDIR%\clean_windows_apps.ps1
::start /b /wait cmd /C "C:\clean_windows_apps.cmd"
echo. "Automating install..."
start /b /wait powershell.exe -file C:\runAutomation.ps1
::start /b /wait cmd /C "& ""C:\runAutomation.ps1"""
echo.
echo.
echo.
echo "Finished automation. Cleaning up..."
del /f /q C:\clean_windows_apps.ps1
del /f /q C:\runAutomation.ps1
timeout /t 5 /nobreak >nul
del /s /q %0 >nul
exit