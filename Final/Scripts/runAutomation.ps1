if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs -Wait; exit }

# get default execution policy
$default_policy = Get-ExecutionPolicy -Scope CurrentUser
# change execution policy for scripts to run
Set-ExecutionPolicy Bypass -Scope  CurrentUser


. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; Get-Boxstarter -Force

Install-BoxstarterPackage `
    -PackageName https://gist.githubusercontent.com/claubervs/3a092ec4b6a314580473dcf26bf23b46/raw/51f6b20e51a874708bf1491e332706ca9e3b0373/myAutomation.ps1 `
    -DisableReboots
    

# change execution policy back to default
Set-ExecutionPolicy $default_policy -Scope CurrentUser