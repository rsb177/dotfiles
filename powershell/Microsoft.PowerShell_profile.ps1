Import-Module PoshColor
# Import-Module -Name Terminal-Icons
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Rich

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Bottom
#. _btm.ps1

# Zoxide
Invoke-Expression (& {
  $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
  (zoxide init --hook $hook powershell) -join "`n"
})

# Aliases
New-Alias -Name vi -Value nvim
New-Alias -Name vim -Value nvim