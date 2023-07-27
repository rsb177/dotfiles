#!/bin/bash

sudo apt update

function aptinstall {
  type -p $1 &>/dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}


APPS="bat ripgrep shellcheck zsh direnv unzip"
for app in $APPS
do
    aptinstall $app
done
