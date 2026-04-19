#!/bin/bash

echo "Installing fnm"
curl -fsSL https://fnm.vercel.app/install | bash

export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

echo "Installing latest LTS Node as global version"
fnm install --lts
fnm default lts-latest
