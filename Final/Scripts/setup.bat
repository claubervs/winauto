@echo off
set "exec=%~dp0setup.ps1"
start powershell -file %exec%
exit