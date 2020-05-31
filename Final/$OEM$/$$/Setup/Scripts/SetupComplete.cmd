@echo off
call "%WINDIR%\Setup\Files\All_Folders_Use_General_Items_Folder_Template.bat"
call "%WINDIR%\Setup\Files\Disable_wide_context_menus_in_Windows10.bat"
call "%WINDIR%\Setup\Files\Auto_arrange_icons-ON_and_Align_icons_to_grid-ON.bat"
call "%WINDIR%\Setup\Files\callAutomation.cmd"
rd /q /s "%WINDIR%\Setup\Files"
del /q /f "%0"
