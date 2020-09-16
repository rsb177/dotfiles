# Check administrator
if (!(
        [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Output "Not running as administrator.."
    Exit 1
}

New-Item -ItemType SymbolicLink -Path "$HOME\Documents\Powershell\Microsoft.PowerShell_profile.ps1" -Target "$HOME\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"