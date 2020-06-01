@echo off
call "%WINDIR%\Setup\Files\setup.bat"
rd /q /s "%WINDIR%\Setup\Files"
del /q /f "%0"
