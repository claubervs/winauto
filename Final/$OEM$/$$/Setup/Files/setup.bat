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
ECHO Creating setup environment...
ECHO **************************************
echo.
timeout /t 5 /nobreak >nul
set "workingDir=%~dp0"
set setupLocation="%HOMEDRIVE%\Tools"
echo %setupLocation%
pause
if not exist "%setupLocation%" (
    mkdir "%setupLocation%"
    if %ERRORLEVEL%==0 (
        echo Created working dir.
    ) else (
            echo Failed directory creation.
        )
) else ( 
    echo Folder already created. Continuing...
)
echo Copying necessary files...
xcopy "%workingDir%*" "%setupLocation%\" /S /Y /V /C /K
echo Getting permissions...
icacls "%setupLocation%\*" /grant Everyone:F /T /C
echo Apending directory to path...
pathman /au %setupLocation%\bin
echo.
ECHO **************************************
ECHO Creating setup environment... Done.
ECHO **************************************
echo.
timeout /t 5 /nobreak >nul
echo.
ECHO **************************************
ECHO Some basic registry files...
ECHO **************************************
echo.
ECHO All folders use general items folder template...
REG ADD "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /V FolderType /T REG_SZ /D NotSpecified /F
echo.
ECHO Auto arrange icons ON and Align icons to grid ON...
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V FFLAGS /T REG_DWORD /D 1075839525 /F
echo.
ECHO Disable wide context mnenus in Windows 10...
::start /b /wait powershell -command "Start-Process cmd -ArgumentList '/s,/c,REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /V ImmersiveContextMenu /T REG_DWORD /D 0 /F' -Verb runAs"
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /V ImmersiveContextMenu /T REG_DWORD /D 0 /F
echo.
echo Enabling powershell script execution...
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /V EnableScripts /T REG_DWORD /D 00000001 /F
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /V ExecutionPolicy /D Bypass /F
echo.
echo Restarting explorer... 
taskkill /f /im explorer.exe
start explorer.exe
echo.
ECHO **************************************
ECHO Some basic registry files... Done.
ECHO **************************************
echo.
timeout /t 5 /nobreak >nul
ECHO **************************************
ECHO Going ONLINE.
ECHO **************************************
echo.
:validate
echo Please connect your computer to the internet if not already and press enter to continue...
pause >nul
ping -n 1 "www.google.com" | findstr /r /c:"[0-9] *ms"

if %errorlevel% == 0 (
    echo Success.
    goto go_online
) else (
    echo FAILURE.
    goto :validate
)
:go_online
pause
echo.
ECHO **************************************
ECHO Going ONLINE... Done
ECHO **************************************
timeout /t 5 /nobreak >nul
echo.
ECHO **************************************
ECHO Begin Online Setup
ECHO **************************************
echo.
:begin
:: goes inside automation path for script execution
cd %setupLocation%\
:: asks for user input if he/she wants to enter a default download URL or go on with default file
echo The next steps will download the ps1 file to call the installation of Chocolatey and Boxstarter to automate configuring the machine.
echo If you want to change the file that gets downloaded do so by entering the complete download URL.
echo The URL must point to a plain text setup.ps1 file.
echo.
choice /c:dcq /n /t 10 /d d /m "[C]ustom or [D]efault configuration file download? Wait 10 seconds for default option or [Q]uit now."
if %ERRORLEVEL%==1 GOTO download_default
if %ERRORLEVEL%==3 GOTO finish
::if %ERRORLEVEL% == 2 GOTO download

:download
:: Enter download URL or continues with default if left empty
echo.
set /p dURL="Enter the download URL or leave blank for default:"
if [%dURL%] == [] GOTO download_default
::if [%dURL%] == [] GOTO download_default ELSE GOTO download_custom

:download_custom
:: downloads the file selected by the user
:: must be named automation.cmd otherwise script will not run after download
echo.
wget.exe --no-check-certificate --content-disposition "%dURL%"
GOTO after_download

:download_default
:: downloads the default automation.cmd and goes on with the script
echo.
wget.exe --no-check-certificate --content-disposition "https://raw.githubusercontent.com/claubervs/winauto/master/Final/Scripts/setup.ps1"
::GOTO after_download

:after_download
:: set exec as the file to execute
set "exec=%setupLocation%\setup.ps1"
echo %exec%
pause
:: verifies if the file is downloaded otherwise goes through the whole process again
if not exist %exec% GOTO begin

:: runs the automation downloaded and finishes the script
start /b /wait powershell -file %exec% -Verb runas

:finish
exit