
#(To remove Adobe Photoshop Express app from all current accounts on PC)
Get-appxpackage -allusers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage -AllUsers
#(To only remove Adobe Photoshop Express app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*AdobeSystemsIncorporated.AdobePhotoshopExpress*'} | remove-appxprovisionedpackage –online


#(To remove Asphalt 8:Airborne app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.Asphalt8Airborne* | Remove-AppxPackage -AllUsers
#(To only remove Asphalt 8:Airborne app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.Asphalt8Airborne*'} | remove-appxprovisionedpackage –online


#(To remove Candy Crush Soda Saga app from all current accounts on PC)
Get-appxpackage -allusers *king.com.CandyCrushSodaSaga* | Remove-AppxPackage -AllUsers
#(To only remove Candy Crush Soda Saga app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*king.com.CandyCrushSodaSaga*'} | remove-appxprovisionedpackage –online


#(To remove Drawboard PDF app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.DrawboardPDF* | Remove-AppxPackage -AllUsers
#(To only remove Drawboard PDF app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.DrawboardPDF*'} | remove-appxprovisionedpackage –online


#(To remove Facebook app from all current accounts on PC)
Get-appxpackage -allusers *Facebook* | Remove-AppxPackage -AllUsers
#(To only remove Facebook app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Facebook*'} | remove-appxprovisionedpackage –online


#(To remove Feedback Hub app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage -AllUsers
#(To only remove Feedback Hub app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.WindowsFeedbackHub*'} | remove-appxprovisionedpackage –online


#(To remove Get Started or Tips (build 1703) app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage -AllUsers
#(To only remove Get Started or Tips (build 1703) app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.Getstarted*'} | remove-appxprovisionedpackage –online


#(To remove Microsoft News app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.BingNews* | Remove-AppxPackage -AllUsers
#(To only remove Microsoft News app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.BingNews*'} | remove-appxprovisionedpackage –online


#(To remove Microsoft Solitaire Collection app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage -AllUsers
#(To only remove Microsoft Solitaire Collection app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.MicrosoftSolitaireCollection*'} | remove-appxprovisionedpackage –online


#(To remove Mobile Plans app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.OneConnect* | Remove-AppxPackage -AllUsers
#(To only remove Mobile Plans app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.OneConnect*'} | remove-appxprovisionedpackage –online


#(To remove Office app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage -AllUsers
#(To only remove Office app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.MicrosoftOfficeHub*'} | remove-appxprovisionedpackage –online


#(To remove Pandora app from all current accounts on PC)
Get-appxpackage -allusers *PandoraMediaInc* | Remove-AppxPackage -AllUsers
#(To only remove Pandora app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*PandoraMediaInc*'} | remove-appxprovisionedpackage –online


#(To remove Skype app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.SkypeApp* | Remove-AppxPackage -AllUsers
#(To only remove Skype app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.SkypeApp*'} | remove-appxprovisionedpackage –online


#(To remove Sports app from all current accounts on PC)
Get-appxpackage -allusers *bingsports* | Remove-AppxPackage -AllUsers
#(To only remove Sports app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*bingsports*'} | remove-appxprovisionedpackage –online


#(To remove Sway app from all current accounts on PC)
Get-appxpackage -allusers *Office.Sway* | Remove-AppxPackage -AllUsers
#(To only remove Sway app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Office.Sway*'} | remove-appxprovisionedpackage –online


#(To remove Tips app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage -AllUsers
#(To only remove Tips app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.Getstarted*'} | remove-appxprovisionedpackage –online


#(To remove Twitter app from all current accounts on PC)
Get-appxpackage -allusers *Twitter* | Remove-AppxPackage -AllUsers
#(To only remove Twitter app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Twitter*'} | remove-appxprovisionedpackage –online


#(To remove Your Phone app from all current accounts on PC)
Get-appxpackage -allusers *Microsoft.YourPhone* | Remove-AppxPackage -AllUsers
#(To only remove Your Phone app from new accounts created afterwards)
Get-appxprovisionedpackage –online | where-object {$_.packagename –like '*Microsoft.YourPhone*'} | remove-appxprovisionedpackage –online

