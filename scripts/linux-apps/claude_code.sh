#!/bin/bash

set -e

echo "Installing Claude Code"
npm install -g @anthropic-ai/claude-code

echo "Symlinking CLAUDE.md"
ln -sf ~/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
