cls
@echo OFF
echo.
echo. "Cleaning Windows Apps..."
start /b /wait powershell.exe -file C:\clean_windows_apps.ps1
:: -noprofile -executionpolicy bypass
:: "& ""C:\clean_windows_apps.ps1"""
:: del /f /q "C:\clean_windows_apps.ps1"
echo "Sleeping 5 seconds..."
timeout /t 5 /nobreak >nul
del /f /q %0