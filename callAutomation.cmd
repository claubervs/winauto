SETLOCAL ENABLEEXTENSIONS
@echo off
set filesPATH="%WINDIR%\Setup\Files"
:: Create new folder in homedrive for scripts and files
if not exist "C:\automation\" mkdir "C:\automation"
set automationPATH="C:\automation"
copy /B "%filesPATH%\wget.exe" "%automationPATH%\"
copy /B "%filesPATH%\wget.exe" "%WINDIR%\System32\"
cd %automationPATH%\
:: Enter download URL or continues with default
:start
set /p dURL="Enter download URL or leave blank for default:"
if [%dURL%] == [] GOTO default ELSE GOTO custom
:custom
wget.exe 
:default
wget.exe 
echo "Enter download URL or leave blank for default:"

:finish


ENDLOCAL

REM echo.
REM echo. "Cleaning Windows Apps..."
REM start /b /wait powershell.exe -file C:\clean_windows_apps.ps1
REM ::start /b /wait cmd /C "C:\clean_windows_apps.cmd"
REM echo. "Automating install..."
REM start /b /wait powershell.exe -file C:\runAutomation.ps1
REM ::start /b /wait cmd /C "& ""C:\runAutomation.ps1"""
REM echo.
REM echo.
REM echo.
REM echo "Finished automation. Cleaning up..."
REM del /f /q C:\clean_windows_apps.ps1
REM del /f /q C:\runAutomation.ps1
REM timeout /t 5 /nobreak >nul
REM del /s /q %0 >nul
REM exit