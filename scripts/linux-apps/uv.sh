#!/bin/bash

set -e

if ! command -v uv &>/dev/null; then
    echo "Installing uv"
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "uv already installed, skipping"
fi

export PATH="$HOME/.local/bin:$PATH"

echo "Determining latest Python version"
LATEST_PYTHON=$(uv python list --all-versions 2>/dev/null \
  | grep -oP 'cpython-\K[0-9]+\.[0-9]+\.[0-9]+(?=-)' \
  | grep -v 'dev\|alpha\|beta\|rc' \
  | sort -V \
  | tail -1)

echo "Installing Python $LATEST_PYTHON as global version"
uv python install "$LATEST_PYTHON"
uv python pin "$LATEST_PYTHON"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REQUIREMENTS="$SCRIPT_DIR/../../python/requirements.txt"

echo "Installing packages from requirements.txt as uv tools"
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
  [[ -z "$pkg" || "$pkg" == \#* ]] && continue
  echo "  Installing $pkg"
  uv tool install "$pkg"
done < "$REQUIREMENTS"
