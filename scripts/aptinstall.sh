#!/bin/bash

# sudo apt update

function aptinstall {
  type -P $1 &>/dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}


declare -A APPS=(
    ["command"]
)

aptinstall nvim
# APPS="neovim bat"
# for app in $APPS
# do
#     install $app
# done

