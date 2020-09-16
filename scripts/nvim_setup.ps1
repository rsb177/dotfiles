# Check administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Output "Not running as administrator.."
    Exit 1
}

New-Item -ItemType SymbolicLink -Path "$HOME\.vim\rich.vim" -Target "$HOME\dotfiles\nvim\rich.vim"
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Local\nvim\init.vim" -Target "$HOME\dotfiles\nvim\init.vim"

# Setup right click option for NVim
Reg import .\rclick-nvim.reg