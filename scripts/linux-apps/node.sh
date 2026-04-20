#!/bin/bash

if ! command -v fnm &>/dev/null; then
    echo "Installing fnm"
    curl -fsSL https://fnm.vercel.app/install | bash
else
    echo "fnm already installed, skipping"
fi

export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

echo "Installing latest LTS Node as global version"
fnm install --lts
fnm default lts-latest
