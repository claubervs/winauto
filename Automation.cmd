@echo off
echo.
echo. "Cleaning Windows Apps..."
start /b /wait powershell.exe -file C:\clean_windows_apps.ps1
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