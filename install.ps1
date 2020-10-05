# Self-Elevate:  If not Admin, Open a new Powershell as admin and execute there
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Output "The current PowerShell session is not running as Administrator."
    Write-Output "Attempting to open a new shell as admin..."
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-NoExit -File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath Powershell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

. "scripts/menu.ps1"


Write-Output "Sup?  I'm an Admin"

# $profileDir = Split-Path -parent $profile

# New-Item -ItemType SymbolicLink -Path "$HOME\.vim\rich.vim" -Target "$HOME\dotfiles\rich.vim"
# New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Local\nvim\init.vim" -Target "$HOME\dotfiles\init.vim"
# # Setup right click option for NVim
# Reg import .\rclick-nvim.reg
# # Mount Ubuntu to U drive for easier navigation
# New-PSDrive -Name "U" -Root "\\wsl$\Ubuntu" -Persist -PSProvider "FileSystem"

