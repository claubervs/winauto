@Echo Off

Echo "Setting Windows Library folders as requested..."

:: Drive letter
Set "DRIVE=Q"
:: Folders from library
Set "3DOBJ=%DRIVE%:\%%USERNAME%%\3D Objects"
Set "CONT=%DRIVE%:\%%USERNAME%%\Contacts"
Set "DESK=%DRIVE%:\%%USERNAME%%\Desktop"
Set "DOCS=%DRIVE%:\%%USERNAME%%\Documents"
Set "DLOAD=%DRIVE%:\%%USERNAME%%\Downloads"
Set "FAVS=%DRIVE%:\%%USERNAME%%\Favorites"
Set "LINKS=%DRIVE%:\%%USERNAME%%\Links"
Set "MUSIC=%DRIVE%:\%%USERNAME%%\Music"
Set "PICS=%DRIVE%:\%%USERNAME%%\Pictures"
Set "GAMES=%DRIVE%:\%%USERNAME%%\Saved Games"
Set "SRCH=%DRIVE%:\%%USERNAME%%\Searches"
Set "VIDS=%DRIVE%:\%%USERNAME%%\Videos"

Set "USF=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
(
    Reg Add "%USF%" /V "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /T REG_EXPAND_SZ /D "%3DOBJ%" /F
    Reg Add "%USF%" /V "{56784854-C6CB-462B-8169-88E350ACB882}" /T REG_EXPAND_SZ /D "%CONT%" /F
    Reg Add "%USF%" /V "Desktop" /T REG_EXPAND_SZ /D "%DESK%" /F
    Reg Add "%USF%" /V "Personal" /T REG_EXPAND_SZ /D "%DOCS%" /F
    Reg Add "%USF%" /V "{374DE290-123F-4565-9164-39C4925E467B}" /T REG_EXPAND_SZ /D "%DLOAD%" /F
    Reg Add "%USF%" /V "Favorites" /T REG_EXPAND_SZ /D "%FAVS%" /F
    Reg Add "%USF%" /V "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /T REG_EXPAND_SZ /D "%LINKS%" /F
    Reg Add "%USF%" /V "My Music" /T REG_EXPAND_SZ /D "%MUSIC%" /F
    Reg Add "%USF%" /V "My Pictures" /T REG_EXPAND_SZ /D "%PICS%" /F
    Reg Add "%USF%" /V "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /T REG_EXPAND_SZ /D "%GAMES%" /F
    Reg Add "%USF%" /V "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /T REG_EXPAND_SZ /D "%SRCH%" /F
    Reg Add "%USF%" /V "My Video" /T REG_EXPAND_SZ /D "%VIDS%" /F
)>NUL

Shutdown /R /D P:2:4