#!/usr/bin/env bash
#
# Everyday CLI tools.

set -e

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# GNU grep (system grep is ancient BSD 2.6). Installs as `ggrep`;
# fish/install.sh puts its gnubin dir on PATH so it's plain `grep` in fish.
brew install grep

# Install other tools
brew install jq
brew install yq
brew install tmux
brew install ruff

brew install node  # also provides corepack
corepack enable # enable npm/pnpm/yarn wrappers
