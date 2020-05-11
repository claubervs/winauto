@Echo Off

Echo "Setting Windows Library folders as requested..."

:: Drive letter
Set "DRIVE=Q"
:: Folders from library
Set "3DOBJ=%DRIVE%:\3D Objects"
Set "CONT=%DRIVE%:\Contacts"
Set "DESK=%DRIVE%:\Desktop"
Set "DOCS=%DRIVE%:\Documents"
Set "DLOAD=%DRIVE%:\Downloads"
Set "FAVS=%DRIVE%:\Favorites"
Set "LINKS=%DRIVE%:\Links"
Set "MUSIC=%DRIVE%:\Music"
Set "PICS=%DRIVE%:\Pictures"
Set "GAMES=%DRIVE%:\Saved Games"
Set "SRCH=%DRIVE%:\Searches"
Set "VIDS=%DRIVE%:\Videos"

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
pause