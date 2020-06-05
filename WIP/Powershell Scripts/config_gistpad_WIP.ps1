#=======================================================================================================
#*** Script created by Clauber Vianna to auto install basic software on his clean Windows install.   ***
#=======================================================================================================

#region SELF ELEVATION
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs -Wait; exit }
#endregion

#region IMPORT MODULES
<#     Import-Module -Name ProgramManagement -Force
    Import-Module -Name RunAs -Force
    Import-Module -Name PowerBash -Force
    Import-Module -Name Sandbox -Force
    Import-Module -Name PSWindowsUpdate -Force
    Import-Module -Name WinGUI -Force #>
#endregion

#region VARIABLE DECLARATION
$Global:BasicEnvironment = $true

$Global:SystemDriveFix = 'https://gist.githubusercontent.com/claubervs/349b926ac822aaddf633/raw/67fc2890835e157847607447cc52c3fb22cf7182/boxstarter_claubervianna_resolve_drive_letters.ps1'

$Global:WindowsCrapwareClean = $true
$Global:WindowsUpdate = $false
$Global:WindowsFeatures = $false
$Global:WindowsRegistry = $false


$Global:ConfigureDriveLetters = $false

$Global:SoftwareInstall = $false

$Global:InstallScript = $false

$Global:IntallDeviceDrivers = $false
#endregion

#region DISCLAIMER
Write-Host ""
Write-Host "========================================="
Write-Host "    **  Starting Boxstarter Script **    "
Write-Host "========================================="
Write-Host ""
Write-Host "This Script was created by Clauber Vianna for personal purposes."
Write-Host "It will configure Windows fresh installation and instal required software."
Write-Host ""
Write-Host "Please use it with caution. Clauber Vianna is not responsible for you running this script."
Write-Host ""
Write-Host "v0.1"
Start-Sleep -Seconds 30
#endregion

#region CLEAN STANDARD WINDOWS PROGRAMS
Write-Host "========================================="
Write-Host "           Clean Crapware                "
Write-Host "========================================="
Write-Host ""

if ($Global:WindowsCrapwareClean -eq $true) {
    Write-Verbose "Removing *AdobeSystemsIncorporated.AdobePhotoshopExpress* from all users."
    Get-appxpackage -allusers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage -AllUsers
    Write-Verbose "Removing *AdobeSystemsIncorporated.AdobePhotoshopExpress* from future user profiles."
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*AdobeSystemsIncorporated.AdobePhotoshopExpress*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.Asphalt8Airborne* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.Asphalt8Airborne*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *king.com.CandyCrush* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*king.com.CandyCrush*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.DrawboardPDF* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.DrawboardPDF*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Facebook* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Facebook*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.WindowsFeedbackHub*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.Getstarted*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.BingNews* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.BingNews*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.MicrosoftSolitaireCollection*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.OneConnect* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.OneConnect*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.MicrosoftOfficeHub*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *PandoraMediaInc* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*PandoraMediaInc*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.SkypeApp* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.SkypeApp*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *bingsports* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*bingsports*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Office.Sway* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Office.Sway*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.Getstarted*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Twitter* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Twitter*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Microsoft.YourPhone* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Microsoft.YourPhone*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *king.com.FarmHeroesSaga* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*king.com.FarmHeroesSaga*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *king.com.* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*king.com.*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *SpotifyAB.SpotifyMusic* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*SpotifyAB.SpotifyMusic*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Hulu* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Hulu*'} | remove-appxprovisionedpackage -online
    Get-appxpackage -allusers *Disney* | Remove-AppxPackage -AllUsers
    Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Disney*'} | remove-appxprovisionedpackage -online
    Write-Host "Done." -ForegroundColor White -BackgroundColor DarkGreen
}
else {
    Write-Warning "Skipping crapware cleaning..."
}



#endregion

#region BASIC ENVIRONMENT
Write-Host "========================================="
Write-Host "           Basic Environment             "
Write-Host "========================================="
# Fix Windows default options
if ($Global:BasicEnvironment -eq $true){
    Set-WindowsExplorerOptions -DisableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -EnableExpandToOpenFolder -EnableShowFileExtensions -DisableOpenFileExplorerToQuickAccess -DisableShowFullPathInTitleBar
    Set-BoxstarterTaskbarOptions -Lock -Dock Bottom -Combine Always -MultiMonitorOff
    Disable-UAC
    Write-Host "Done." -ForegroundColor White -BackgroundColor DarkGreen
}
else {
    Write-Warning "Skipping basic environment..."
}
Write-Host ""
#endregion

#region REGISTRY FILES
Write-Host "========================================="
Write-Host "             Registry Files              "
Write-Host "========================================="
#endregion

#region WINDOWS UPDATE
Write-Host "========================================="
Write-Host "            Updating Windows             "
Write-Host "========================================="
Write-Host ""
if ($Global:WindowsUpdate -eq $true){
    Enable-MicrosoftUpdate
    Install-WindowsUpdate -getUpdatesFromMS -acceptEula -SuppressReboots
    Write-Host "Done." -ForegroundColor White -BackgroundColor DarkGreen
}
    else{
        Write-Warning "Skipping Windows updates..."
}
#endregion

#region DRIVE LETTERS
Write-Host "========================================="
Write-Host "     Assigning Custom Drive Letters      "
Write-Host "========================================="
Write-Host ""
if ($Global:ConfigureDriveLetters){
    Invoke-Expression ((new-object net.webclient).DownloadString($Global:DriveCorrectionURL))
    Write-Host "Done." -ForegroundColor White -BackgroundColor DarkGreen
}
else{
    Write-Warning "Skipping Drives Configuration..."
}
#endregion 

#region INSTALL WINDOWS FEATURES
Write-Host ""
Write-Host "========================================="
Write-Host "      Installing Windows Features        "
Write-Host "========================================="
Write-Host ""

if ($Global:WindowsFeatures -eq -$true) {
    choco install -name Microsoft-Windows-Subsystem-Linux --source windowsfeatures --noop
    choco install -name HypervisorPlatform --source windowsfeatures -noop
    choco install -name VirtualMachinePlatform --source windowsfeatures -noop
    choco install -name Microsoft-Hyper-V-All --source windowsfeatures -noop
    choco install -name Windows-Defender-ApplicationGuard --source windowsfeatures -noop
    Write-Host "Done." -ForegroundColor White -BackgroundColor DarkGreen
}
else {
    Write-Warning "Skipping Windows fetures installation..."
}
#endregion

#region INSTALL PROGRAMS
Write-Host ""
Write-Host "========================================="
Write-Host "           Installing Programs           "
Write-Host "========================================="
Write-Host ""

if ($Global:SoftwareInstall -eq $true) {
    #region Necessary software pack
    choco upgrade git -y
    choco upgrade gitahead -y
    choco upgrade brave -y
    choco upgrade vscodium -y
    choco upgrade msiafterburner -y
    choco upgrade razer-synapse-2 -y
    choco upgrade logitechgaming -y
    choco upgrade dnsjumper -y
    choco upgrade winaero-tweaker -y
    choco upgrade bulk-crap-uninstaller -y
    choco upgrade unchecky -y
    choco upgrade infekt -y
    choco upgrade veracrypt -y
    choco upgrade LinkShellExtension -y
    choco upgrade stardock-fences -y
    choco upgrade lockhunter -y
    choco upgrade FoxitReader -y
    choco upgrade mpc-be -y
    choco upgrade winrar --version=5.90 -y
    choco upgrade adoptopenjdkjre -y
    choco upgrade sharex -y
    choco upgrade eartrumpet -y
        #endregion

    #region Other software
    choco upgrade wox -y
    choco upgrade powertoys -y
    choco upgrade teamviewer -y
    choco upgrade TeraCopy -y
    choco upgrade discord -y
    choco upgrade 7zip -y
    choco upgrade qbittorrent -y
    choco upgrade steam -y
    choco upgrade epicgameslauncher -y
    choco upgrade origin -y
    choco upgrade battle.net -y
    #endregion

    #region developer alternative software
    choco upgrade hyper -y
    choco upgrade jetbrainsmono -y
    choco upgrade firacode -y
    #endregion
    
    Write-Host "Done." -ForegroundColor White -BackgroundColor DarkGreen
}
else {
    Write-Warning "Skipping software installation..."
}
#endregion

# Return command to user

Enable-UAC