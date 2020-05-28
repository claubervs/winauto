SETLOCAL
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
:: goes inside automation path for script execution
cd %automationPATH%\

:begin
:: asks for user input if he/she wants to enter a default download URL or go on with default file
choice /c:dc /n /t 10 /d d /m "[C]ustom or [D]efault configuration file download? Wait 10 seconds for default option."
if %ERRORLEVEL% == 1 GOTO download_default
if %ERRORLEVEL% == 2 GOTO download

:download
:: Enter download URL or continues with default if left empty
set /p dURL="Enter download URL or leave blank for default (file must be named automation.cmd):"
if [%dURL%] == [] GOTO download_default ELSE GOTO download_custom

:download_custom
:: downloads the file selected by the user
:: must be named automation.cmd otherwise script will not run after download
wget.exe --no-check-certificate --content-disposition "%dURL%"
GOTO after_download

:download_default
:: downloads the default automation.cmd and goes on with the script
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/automation.cmd"
GOTO after_download

:after_download
:: verifies if the file is downloaded otherwise goes through the whole process again
if not exist %automationPATH%\automation.cmd GOTO begin
:: set exec as the file to execute
set exec="%automationPATH%\automation.cmd"
GOTO main

:main
:: runs the automation downloaded and finishes the script
call exec
GOTO finish
::clean
::rd /s /q %automationPATH%
::GOTO finish
:finish
exit