#!/usr/bin/env bash
#
# Installs Homebrew itself (https://brew.sh).
# Package installs live in each topic's install.sh.

set -e

if ! command -v brew &>/dev/null && [ ! -x /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/brew/HEAD/install.sh)"
fi

if ! grep -qs 'brew shellenv' "$HOME/.zprofile"; then
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$HOME/.zprofile"  # zsh PATH (fish PATH handled in fish/install.sh)
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
