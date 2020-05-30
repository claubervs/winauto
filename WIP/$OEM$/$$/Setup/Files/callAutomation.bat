::::::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights V2
::::::::::::::::::::::::::::::::::::::::::::
@echo off
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
echo.
ECHO **************************************
ECHO Calling online installation files
ECHO **************************************
echo.
::timeout /t 1 /nobreak >nul
:prepare
:: Set variable to get files from the OEM default location
::set filesPATH="%WINDIR%\Setup\Files"
set "setupLocation=%HOMEDRIVE%\Tools"
:: Create new folder in homedrive for scripts and files
::if not exist %setupLocation% mkdir %setupLocation%
:: Set the created folder to automationPATH
::set automationPATH="C:\automation"
:: copy wget and dependencies to automation folder
::copy "%filesPATH%\wget\*.*" "%automationPATH%\"
:: copy wget and dependencies to system32 folder
::copy "%filesPATH%\wget\*.*" "%WINDIR%\System32\"
:: deletes wget files and dependencies from original folder
::rd /s /q "%filesPATH%\wget"

:begin
:: goes inside automation path for script execution
cd %setupLocation%\
:: asks for user input if he/she wants to enter a default download URL or go on with default file
choice /c:dcq /n /t 10 /d d /m "[C]ustom or [D]efault configuration file download? Wait 10 seconds for default option or [Q]uit now."
if %ERRORLEVEL%==1 GOTO download_default
if %ERRORLEVEL%==3 GOTO finish
::if %ERRORLEVEL% == 2 GOTO download

:download
:: Enter download URL or continues with default if left empty
set /p dURL="Enter the download URL or leave blank for default (file must be named automation.cmd):"
if [%dURL%] == [] GOTO download_default
::if [%dURL%] == [] GOTO download_default ELSE GOTO download_custom

:download_custom
:: downloads the file selected by the user
:: must be named automation.cmd otherwise script will not run after download
wget.exe --no-check-certificate --content-disposition "%dURL%"
GOTO after_download

:download_default
:: downloads the default automation.cmd and goes on with the script
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/automation.bat"
::GOTO after_download

:after_download
:: set exec as the file to execute
set "exec=%setupLocation%\automation.bat"
echo %exec%
:: verifies if the file is downloaded otherwise goes through the whole process again
if not exist %exec% GOTO begin
::GOTO main

:main
:: runs the automation downloaded and finishes the script
cmd /c %exec%
::clean
::rd /s /q %automationPATH%
::GOTO finish
:finish
exit