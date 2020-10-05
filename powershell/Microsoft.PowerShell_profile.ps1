# Determine user profile parent directory.
$ProfilePath = Split-Path -parent $profile

$modules = (
  "posh-git",
  "oh-my-posh",
  "Terminal-Icons"
)
$modules | ForEach-Object {
  if (Get-Module -ListAvailable -Name $_) {
    Import-Module $_
  }
}

# Load function definitions from separate configuration file.
if (Test-Path $ProfilePath/Functions.ps1) {
  . $ProfilePath/Functions.ps1
}

Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
# Make Vi-mode more like bash Vi-mode
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Fix PS color scheme for dark backgrounds
Set-PSReadLineOption -Colors @{ "Operator"="Magenta" }
Set-PSReadLineOption -Colors @{ "Parameter"="Magenta" }
Set-Theme Rich

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Import popular commands from Linux.
if (Get-Command Import-WslCommand -errorAction Ignore) {
  $WslCommands = @(
    "chmod",
    "grep",
    "head",
    "less",
    "exa",
    "man",
    "tail",
    "touch"
  )
  $WslImportedCommands = @()
  $WslDefaultParameterValues = @{
    grep = "-E";
    less = "-i";

  }

  $WslEnvironmentVariables = @{
    PATH = "/home/rsb177/.cargo/bin/"
  }

  $WslCommands | ForEach-Object {
    if (!(Get-Command $_ -errorAction Ignore)) {
      $WslImportedCommands += $_
      Import-WslCommand "$_"
    }
  }
}

# Bottom
#. _btm.ps1

# Zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
  })

# Load alias definitions from separate configuration file.
if (Test-Path $ProfilePath/Aliases.ps1) {
  . $ProfilePath/Aliases.ps1
}