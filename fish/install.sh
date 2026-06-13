#!/usr/bin/env bash
#
# Fish shell + Oh My Fish + bobthefish.
# Docs: https://fishshell.com/docs/current/ · https://github.com/oh-my-fish/oh-my-fish

set -e

FISH=/opt/homebrew/bin/fish
DOTFILES_ROOT="$(cd "$(dirname "$0")/.." && pwd -P)"

brew install fish

if ! grep -q "$FISH" /etc/shells; then
  sudo sh -c "echo $FISH >> /etc/shells"  # register as allowed login shell
fi

# compare the real login shell ($SHELL is just an env var and can be stale)
if [ "$(dscl . -read "/Users/$USER" UserShell 2>/dev/null | awk '{print $2}')" != "$FISH" ]; then
  chsh -s "$FISH"  # set as default shell (prompts for password)
fi

# || true: fish_add_path exits 1 when the paths are all already present
"$FISH" -c "fish_add_path /opt/homebrew/bin ~/.local/bin $DOTFILES_ROOT/bin" || true  # homebrew + pip/pipx/claude binaries + dotfiles bin (dot)
"$FISH" -c "fish_add_path /opt/homebrew/opt/grep/libexec/gnubin" || true  # GNU grep as plain `grep` (installed in cli/install.sh)

if ! "$FISH" -c "type -q omf"; then
  curl -fsSL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | "$FISH"
fi
"$FISH" -c "omf list | grep -q bobthefish; or omf install bobthefish"
