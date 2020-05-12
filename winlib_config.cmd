@Echo Off

taskkill /f /im explorer.exe
Echo "Setting Windows Library folders as requested..."
timeout /t 2 /nobreak >nul
:: Drive letter
Set "PATH=Q:\"
:: Folders from library
Set "3DOBJ=%PATH%\3D Objects"
Set "CONT=%PATH%\Contacts"
Set "DESK=%PATH%\Desktop"
Set "DOCS=%PATH%\Documents"
Set "DLOAD=%PATH%\Downloads"
Set "FAVS=%PATH%\Favorites"
Set "LINKS=%PATH%\Links"
Set "MUSIC=%PATH%\Music"
Set "PICS=%PATH%\Pictures"
Set "GAMES=%PATH%\Saved Games"
Set "SRCH=%PATH%\Searches"
Set "VIDS=%PATH%\Videos"

(
    if not exist "%3DOBJ%" mkdir "%3DOBJ%"
    if not exist "%CONT%" mkdir "%CONT%"
    if not exist "%DESK%" mkdir "%DESK%"
    if not exist "%DOCS%" mkdir "%DOCS%"
    if not exist "%DLOAD%" mkdir "%DLOAD%"
    if not exist "%FAVS%" mkdir "%FAVS%"
    if not exist "%LINKS%" mkdir "%LINKS%"
    if not exist "%MUSIC%" mkdir "%MUSIC%"
    if not exist "%PICS%" mkdir "%PICS%"
    if not exist "%GAMES%" mkdir "%GAMES%"
    if not exist "%SRCH%" mkdir "%SRCH%"
    if not exist "%VIDS%" mkdir "%VIDS%"
)>nul

Set "USF=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
(
    Reg Add "%USF%" /V "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /T REG_EXPAND_SZ /D "%3DOBJ%" /F
    Reg Add "%USF%" /V "{56784854-C6CB-462B-8169-88E350ACB882}" /T REG_EXPAND_SZ /D "%CONT%" /F
    Reg Add "%USF%" /V "Desktop" /T REG_EXPAND_SZ /D "%DESK%" /F
    Reg Add "%USF%" /V "Personal" /T REG_EXPAND_SZ /D "%DOCS%" /F
    Reg Add "%USF%" /V "{374DE290-123F-4565-9164-39C4925E467B}" /T REG_EXPAND_SZ /D "%DLOAD%" /F
    Reg Add "%USF%" /V "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /T REG_EXPAND_SZ /D "%DLOAD%" /F
    Reg Add "%USF%" /V "Favorites" /T REG_EXPAND_SZ /D "%FAVS%" /F
    Reg Add "%USF%" /V "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /T REG_EXPAND_SZ /D "%LINKS%" /F
    Reg Add "%USF%" /V "My Music" /T REG_EXPAND_SZ /D "%MUSIC%" /F
    Reg Add "%USF%" /V "My Pictures" /T REG_EXPAND_SZ /D "%PICS%" /F
    Reg Add "%USF%" /V "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /T REG_EXPAND_SZ /D "%PICS%" /F
    Reg Add "%USF%" /V "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /T REG_EXPAND_SZ /D "%GAMES%" /F
    Reg Add "%USF%" /V "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /T REG_EXPAND_SZ /D "%SRCH%" /F
    Reg Add "%USF%" /V "My Video" /T REG_EXPAND_SZ /D "%VIDS%" /F
)>NUL

::Shutdown /R /D P:2:4
::pause
timeout /t 1 /nobreak >nul

start explorer.exe