# Vim
New-Alias -Name vi -Value nvim -Force
New-Alias -Name vim -Value nvim -Force

# EXA/LS
Function exa_ll { exa -lbGhgF --color always --icons -a --git }
Function exa_ls { exa -lbGhgF --color auto --icons -a -s type --git }
New-Alias -Name ll -Value Get-ChildItem -Force
New-Alias -Name ls -Value Get-ChildItem -Force

# Poetry
function poetry_shell() {
    $envInfo = ($envInfo | Select-String -Pattern "Path:\s+(?<path>\S+)")
    $venvPath = $envInfo.Matches.Groups[1].Value + "\Scripts\Activate.ps1"
    . $venvPath
}

New-Alias -Name pshell -Value poetry_shell -Force