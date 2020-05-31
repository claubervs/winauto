if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs -Wait; exit }

# get default execution policy
$default_policy = Get-ExecutionPolicy -Scope CurrentUser
# change execution policy for scripts to run
Set-ExecutionPolicy Bypass -Scope CurrentUser


$credential= Get-Credential

# Get-Credential CVS20181104\claub


. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; Get-Boxstarter -Force

Install-BoxstarterPackage `
    -PackageName https://gist.githubusercontent.com/claubervs/ddb55442e1348263d1c6/raw/cv_script.ps1 `
    -DisableReboots
    

# change execution policy back to default
Set-ExecutionPolicy $default_policy -Scope CurrentUser