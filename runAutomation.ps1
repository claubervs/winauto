. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force

Install-BoxstarterPackage `
    -PackageName https://gist.githubusercontent.com/claubervs/3a092ec4b6a314580473dcf26bf23b46/raw/5b399ae342b85754b0de296d3dd0d50117a45f04/myAutomation.ps1 `
    -DisableReboots