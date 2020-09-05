powershell.exe Set-ExecutionPolicy Unrestricted
pause
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%USERPROFILE%\Desktop\install.ps1""' -Verb RunAs}
pause