#!/usr/bin/env bash
#
# Claude Code. Docs: https://code.claude.com/docs/en/setup

set -e

if ! command -v claude &>/dev/null && [ ! -x "$HOME/.local/bin/claude" ]; then
  curl -fsSL https://claude.ai/install.sh | bash  # installs to ~/.local/bin, auto-updates
fi
