#!/usr/bin/env bash
#
# SSH key + github.com config (key auto-loads into agent, passphrase in
# macOS keychain).
# Docs: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

set -e

KEY="$HOME/.ssh/id_ed25519"

if [ ! -f "$KEY" ]; then
  email=$(git config user.email || true)
  ssh-keygen -t ed25519 -C "${email:-nikroulah@gmail.com}" -f "$KEY"
fi

if ! grep -qs "Host github.com" "$HOME/.ssh/config"; then
  mkdir -p "$HOME/.ssh"
  cat >> "$HOME/.ssh/config" <<'EOF'
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
fi

# /usr/bin explicitly: --apple-use-keychain is an Apple patch, missing from brew openssh
/usr/bin/ssh-add --apple-use-keychain "$KEY"  # save passphrase to keychain (one-time per machine)
