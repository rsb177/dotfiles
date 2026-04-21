# Vim
New-Alias -Name vi -Value nvim -Force
New-Alias -Name vim -Value nvim -Force

# EZA/LS
if (Get-Command Remove-Alias -ErrorAction SilentlyContinue) {
    Remove-Alias -Name ll -Force -ErrorAction SilentlyContinue
    Remove-Alias -Name ls -Force -ErrorAction SilentlyContinue
} else {
    Remove-Item alias:ll -Force -ErrorAction SilentlyContinue
    Remove-Item alias:ls -Force -ErrorAction SilentlyContinue
}
Function ll { eza -lbGhgF --color always --icons -a --git @args }
Function ls { eza -lbGhgF --color auto --icons -a -s type --git @args }
