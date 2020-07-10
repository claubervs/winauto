if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

Write-Host "Installing Secure Delete..."
$default_policy = Get-ExecutionPolicy -Scope CurrentUser

Write-Host "Acquiring permissions..."
Set-ExecutionPolicy Bypass -Scope  CurrentUser

$copiedFile = Copy-Item $PSScriptRoot"\sdelete.exe" -Destination "C:\Windows\System32" -Force -PassThru
Write-Host "Copied file"$copiedFile.Name"to"$copiedFile.DirectoryName

regedit.exe /s $PSScriptRoot"\Add_Secure_Delete_to_Recycle_Bin_context_menu.reg"

#Write-Host "Result: "$result

Write-Host "Returning default policy for user..."
Set-ExecutionPolicy $default_policy -Scope CurrentUser