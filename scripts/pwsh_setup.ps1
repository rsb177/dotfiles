# Check administrator
# if (!(
#         [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
#     ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
#     Write-Output "Not running as administrator.."
#     Exit 1
# }

# function Get-PowershellStatus {

#     $status = [ordered]@{}

#     $missing_modules = New-Object System.Collections.ArrayList
#     $modules | ForEach-Object {
#         if (!(Get-Module -ListAvailable -Name $_ -ErrorAction "Ignore")) {
#             $missing_modules.Add($_) > $null
#         }
#     }
#     $status.add('MissingModules', $missing_modules)

#     return $status
# }

# Get-PowershellStatus
# exit

# Derive profile directories from $PROFILE so OneDrive redirection is respected
$pwshDir   = Split-Path $PROFILE                                                        # PS7+
$legacyDir = (Split-Path $PROFILE) -replace '\\PowerShell$', '\WindowsPowerShell'      # PS5

# Ensure parent directories exist
New-Item -ItemType Directory -Force -Path $pwshDir   | Out-Null
New-Item -ItemType Directory -Force -Path $legacyDir | Out-Null

$dotfiles = "$HOME\dotfiles\powershell"

# Sym-link files
New-Item -ItemType SymbolicLink -Force -Path "$pwshDir\Microsoft.PowerShell_profile.ps1"   -Target "$dotfiles\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink -Force -Path "$legacyDir\Microsoft.PowerShell_profile.ps1" -Target "$dotfiles\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink -Force -Path "$pwshDir\Aliases.ps1"                        -Target "$dotfiles\Aliases.ps1"
New-Item -ItemType SymbolicLink -Force -Path "$pwshDir\Functions.ps1"                      -Target "$dotfiles\Functions.ps1"
New-Item -ItemType SymbolicLink -Force -Path "$legacyDir\Aliases.ps1"                      -Target "$dotfiles\Aliases.ps1"
New-Item -ItemType SymbolicLink -Force -Path "$legacyDir\Functions.ps1"                    -Target "$dotfiles\Functions.ps1"
New-Item -ItemType SymbolicLink -Force -Path "$pwshDir\Microsoft.VSCode_profile.ps1"       -Target "$dotfiles\Microsoft.PowerShell_profile.ps1"

# PSReadLine ships pre-installed on PS5 (not via Install-Module), so Update-Module won't work
Write-Host "Installing/updating PSReadLine..."
Install-Module PSReadLine -Force -SkipPublisherCheck -ErrorAction SilentlyContinue

# Modules to install
$modules = (
    "posh-git",
    "Terminal-Icons",
    "PoshColor",
    "WslInterop"
)
$modules | ForEach-Object {
    if (Get-Module -ListAvailable -Name $_ -ErrorAction "Ignore") {
        Write-Host "Checking for $($_) updates..."
        Update-Module $_ -Force
    }
    else {
        Write-Host "Installing $($_) ..."
        Install-Module $_ -Force -SkipPublisherCheck -ErrorAction SilentlyContinue
    }
}

# Download ColorTool to set color scheme for main powershell console when not using WT

