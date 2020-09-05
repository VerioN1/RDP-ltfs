if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

New-Item -ItemType Directory -Path "C:\rlfs"
Move-Item -Path $env:userprofile\Desktop\Install.ps1 -Destination C:\rlfs
Move-Item -Path $env:userprofile\Desktop\START.bat -Destination C:\rlfs
Move-Item -Path $env:userprofile\Desktop\rlfs1.ps1 -Destination C:\rlfs
Move-Item -Path $env:userprofile\Desktop\rlfs.bat -Destination C:\rlfs
attrib +h C:\rlfs
pause
try {
#set-ItemProperty -Path 'Registry::HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\Open\Command' -Name '(default)' -Value '"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -noLogo -ExecutionPolicy unrestricted -file "%1"'
$oldPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newPath = $oldPath+';c:\rlfs'
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
} catch { $ErrorMessage = $_.Exception.Message
    if ($ErrorMessage  -like '*Access*') {
        Write-Output 'Access Denied'
    }}
pause
#make powershell scripts open by double click
#add rlfs to path