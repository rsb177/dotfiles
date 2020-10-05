# Vim
New-Alias -Name vi -Value nvim -Force
New-Alias -Name vim -Value nvim -Force

# EXA/LS
Function exa_ll {exa -lbGhgF --color always --icons -a --git}
Function exa_ls {exa -lbGhgF --color auto --icons -a -s type --git}
New-Alias -Name ll -Value exa_ll -Force
New-Alias -Name ls -Value exa_ls -Force