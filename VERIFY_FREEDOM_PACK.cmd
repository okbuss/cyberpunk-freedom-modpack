@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0VERIFY_FREEDOM_PACK.ps1" %*
echo.
pause
