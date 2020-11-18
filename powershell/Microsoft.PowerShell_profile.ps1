# Determine user profile parent directory.
$ProfilePath = Split-Path -parent $profile

$modules = (
  "posh-git",
#  "oh-my-posh",
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

# Disable Poetry env prompt (will be handled with our custom prompt)
$Env:VIRTUAL_ENV_DISABLE_PROMPT = 1

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

[ScriptBlock]$Prompt = {
  $realLASTEXITCODE = $global:LASTEXITCODE
  if ($realLASTEXITCODE -isnot [int]) {
    $realLASTEXITCODE = 0
  }
  $startInfo = New-Object System.Diagnostics.ProcessStartInfo
  $startInfo.FileName = "oh-my-posh.exe"
  $cleanPWD = $PWD.ProviderPath.TrimEnd("\")
  $startInfo.Arguments = "-config=""$env:home\dotfiles\oh-my-posh3\rich.json"" -error=$realLASTEXITCODE -pwd=""$cleanPWD"""
  $startInfo.Environment["TERM"] = "xterm-256color"
  $startInfo.CreateNoWindow = $true
  $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
  $startInfo.RedirectStandardOutput = $true
  $startInfo.UseShellExecute = $false
  if ($PWD.Provider.Name -eq 'FileSystem') {
    $startInfo.WorkingDirectory = $PWD.ProviderPath
  }
  $process = New-Object System.Diagnostics.Process
  $process.StartInfo = $startInfo
  $process.Start() | Out-Null
  $standardOut = $process.StandardOutput.ReadToEnd()
  $process.WaitForExit()
  $standardOut
  $global:LASTEXITCODE = $realLASTEXITCODE
  Remove-Variable realLASTEXITCODE -Confirm:$false
}
Set-Item -Path Function:prompt -Value $Prompt -Force