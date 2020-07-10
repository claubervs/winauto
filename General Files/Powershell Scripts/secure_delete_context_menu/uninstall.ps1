if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

Write-Host "Uninstalling Secure Delete..."
$default_policy = Get-ExecutionPolicy -Scope CurrentUser

Write-Host "Acquiring permissions..."
Set-ExecutionPolicy Bypass -Scope  CurrentUser

# Remove-Item -Path "C:\Windows\System32\sdelete.exe" -Force
# Write-Host "Deleted item C:\Windows\System32\sdelete.exe"

regedit.exe /s $PSScriptRoot\"Remove_Secure_Delete_from_context_menu.reg"

Write-Host "Returning default policy for user..."
Set-ExecutionPolicy $default_policy -Scope CurrentUser