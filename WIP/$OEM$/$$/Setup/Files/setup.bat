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
pathman /au %setupLocation%
echo. 
echo.
ECHO **************************************
ECHO Creating setup environment... Done.
ECHO **************************************
echo.
timeout /t 5 /nobreak >nul
echo.
ECHO **************************************
ECHO Final registry files installation...
ECHO **************************************
echo.
cmd /c "%setupLocation%\All_Folders_Use_General_Items_Folder_Template.bat"
cmd /c "%setupLocation%\Auto_arrange_icons-ON_and_Align_icons_to_grid-ON.bat"
cmd /c "%setupLocation%\Disable_wide_context_menus_in_Windows10.bat"
echo.
ECHO **************************************
ECHO Final registry files installation... Done.
ECHO **************************************
echo.
timeout /t 5 /nobreak >nul
echo.
cmd /c "%setupLocation%\wget\setup.bat"
echo.
echo Continuing automation...
echo.
timeout /t 5 /nobreak >nul
cmd /c "%setupLocation%\callAutomation.bat"
exit