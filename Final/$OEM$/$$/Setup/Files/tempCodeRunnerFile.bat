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