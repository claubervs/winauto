SETLOCAL ENABLEEXTENSIONS
@echo off
:prepare
set filesPATH="%WINDIR%\Setup\Files"
:: Create new folder in homedrive for scripts and files
if not exist "C:\automation\" mkdir "C:\automation"
set automationPATH="C:\automation"
:: copy wget and dependencies to automation folder
copy "%filesPATH%\wget\*.*" "%automationPATH%\"
:: copy wget and dependencies to system32 folder
copy "%filesPATH%\wget\*.*" "%WINDIR%\System32\"
:: deletes wget files and dependencies from original folder
rd /s /q "%filesPATH%\wget"
:start
:: enter automation path for script execution
cd %automationPATH%\
choice /c:dc /n /t 10 /d d /m "[C]ustom or [D]efault configuration file download? Wait 10 seconds for default option."
if %ERRORLEVEL% == 1 GOTO download_default
if %ERRORLEVEL% == 2 GOTO download
:download
:: Enter download URL or continues with default
set /p dURL="Enter download URL or leave blank for default (file must be named automation.cmd):"
if [%dURL%] == [] GOTO download_default ELSE GOTO download_custom
:download_custom
wget.exe --no-check-certificate --content-disposition "%dURL%"
GOTO after_download
:download_default
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/automation.cmd"
GOTO after_download
:after_download
if not exist %automationPATH%\automation.cmd GOTO download_default
set exec="%automationPATH%\automation.cmd"
GOTO main
:main
call exec
GOTO finish
:clean
::rd /s /q %automationPATH%
GOTO finish
:finish
exit

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