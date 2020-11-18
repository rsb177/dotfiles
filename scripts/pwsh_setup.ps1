# Check administrator
# if (!(
#         [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
#     ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
#     Write-Output "Not running as administrator.."
#     Exit 1
# }

function Get-PowershellStatus {

    $status = [ordered]@{}

    $missing_modules = New-Object System.Collections.ArrayList
    $modules | ForEach-Object {
        if (!(Get-Module -ListAvailable -Name $_ -ErrorAction "Ignore")) {
            $missing_modules.Add($_) > $null
        }
    }
    $status.add('MissingModules', $missing_modules)

    return $status
}

Get-PowershellStatus
exit

# Sym-link files
New-Item -ItemType SymbolicLink `
    -Path "$HOME\Documents\Powershell\Microsoft.PowerShell_profile.ps1" `
    -Target "$HOME\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink `
    -Path "$HOME\Documents\Powershell\Aliases.ps1" `
    -Target "$HOME\dotfiles\powershell\Aliases.ps1"
New-Item -ItemType SymbolicLink `
    -Path "$HOME\Documents\Powershell\Functions.ps1" `
    -Target "$HOME\dotfiles\powershell\Functions.ps1"
New-Item -ItemType SymbolicLink `
    -Path "$HOME\Documents\Powershell\Microsoft.VSCode_profile.ps1" `
    -Target "$HOME\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"

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
        Update-Module $_
    }
    else {
        Write-Host "Installing $($_) ..."
        Install-Module $_ -Force -ErrorAction SilentlyContinue
    }
}

# Download ColorTool to set color scheme for main powershell console when not using WT

