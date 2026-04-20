#!/bin/bash

set -e

if ! command -v claude &>/dev/null; then
    echo "Installing Claude Code"
    npm install -g @anthropic-ai/claude-code
else
    echo "Claude Code already installed, skipping"
fi

echo "Symlinking CLAUDE.md"
ln -sf ~/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
