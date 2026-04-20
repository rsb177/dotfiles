#!/bin/bash

type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)

if ! apt-cache policy | grep -q "cli.github.com"; then
    sudo apt-add-repository https://cli.github.com/packages
fi

if ! apt-cache policy | grep -q "git-core/ppa"; then
    sudo add-apt-repository ppa:git-core/ppa
fi

sudo apt update && sudo apt upgrade git -y

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
