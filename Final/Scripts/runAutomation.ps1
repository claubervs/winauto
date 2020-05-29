if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs -Wait; exit }

# get default execution policy
$default_policy = Get-ExecutionPolicy -Scope CurrentUser
# change execution policy for scripts to run
Set-ExecutionPolicy Bypass -Scope  CurrentUser


. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; Get-Boxstarter -Force

Install-BoxstarterPackage `
    -PackageName https://gist.githubusercontent.com/claubervs/3a092ec4b6a314580473dcf26bf23b46/raw/5b399ae342b85754b0de296d3dd0d50117a45f04/myAutomation.ps1 `
    -DisableReboots
    

# change execution policy back to default
Set-ExecutionPolicy $default_policy -Scope CurrentUser