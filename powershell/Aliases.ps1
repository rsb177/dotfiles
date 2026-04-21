# Vim
New-Alias -Name vi -Value nvim -Force
New-Alias -Name vim -Value nvim -Force

# EZA/LS
Function ll { eza -lbGhgF --color always --icons -a --git @args }
Function ls { eza -lbGhgF --color auto --icons -a -s type --git @args }
Remove-Alias -Name ll -Force -ErrorAction SilentlyContinue
Remove-Alias -Name ls -Force -ErrorAction SilentlyContinue

# Poetry
function poetry_shell() {
    $envInfo = ($envInfo | Select-String -Pattern "Path:\s+(?<path>\S+)")
    $venvPath = $envInfo.Matches.Groups[1].Value + "\Scripts\Activate.ps1"
    . $venvPath
}

New-Alias -Name pshell -Value poetry_shell -Force