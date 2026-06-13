# Personal Dev Environment Setup

Each code block is safe to paste into a terminal as a unit. Steps marked **Manual step** require action outside the terminal.

> **Note:** Commands and URLs drift over time — skim the linked docs before running each step.

## 1. Xcode Command Line Tools

Docs: https://developer.apple.com/xcode/resources/

```bash
xcode-select --install
```

**Manual step:** Pop-up — click `Install`.

## 2. Homebrew

Docs: https://brew.sh

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/brew/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile  # add brew to zsh PATH
eval "$(/opt/homebrew/bin/brew shellenv)"  # apply to current session
```

## 3. Fish shell

Docs: https://fishshell.com/docs/current/ · FAQ (default shell): https://fishshell.com/docs/current/faq.html

```bash
brew install fish
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'  # register fish as allowed login shell
chsh -s /opt/homebrew/bin/fish  # set as default shell
fish
```

From here on, commands run in fish:

```fish
fish_add_path /opt/homebrew/bin  # homebrew binaries
fish_add_path ~/.local/bin  # pip --user, pipx, claude installer binaries
fish_update_completions  # generate tab completions from man pages
```

Also set name/email for use in ssh keygen and git config:

```fish
set name "Your Name"
set email "your-email@example.com"
```

### Oh My Fish + bobthefish theme

Docs: https://github.com/oh-my-fish/oh-my-fish · https://github.com/oh-my-fish/theme-bobthefish

```fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install bobthefish
```

### Terminal font (needed for bobthefish glyphs)

Ghostty's bundled default font (JetBrains Mono with Nerd Font fallback, https://ghostty.org/docs/config) renders the bobthefish glyphs out of the box — **no font setup needed on Ghostty**.

For other terminals, install a Nerd Font (https://github.com/ryanoasis/nerd-fonts):

```fish
brew install --cask font-meslo-lg-nerd-font  # or font-jetbrains-mono-nerd-font, font-fira-code-nerd-font, etc.
```

**Manual step (non-Ghostty only):** Set the terminal's font to the installed Nerd Font.

Optional, for extra glyphs if your font supports them:

```fish
set -U theme_nerd_fonts yes  # not needed for ghostty
```

## 4. SSH keys

Docs: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

```fish
ssh-keygen -t ed25519 -C "$email"
```

```fish
# auto-load key into agent, store passphrase in macOS keychain
echo 'Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519' >> ~/.ssh/config
```

```fish
ssh-add --apple-use-keychain ~/.ssh/id_ed25519  # save passphrase to keychain (one-time per machine)
cat ~/.ssh/id_ed25519.pub | pbcopy  # copy public key
```

**Manual step:** Paste at https://github.com/settings/keys → `New SSH key` ([docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)).

## 5. CLI tools

```fish
brew install jq yq git tmux ruff
```

## 6. Git config

Docs: https://git-scm.com/docs/git-config

```fish
git config --global user.name "$name"  # shown on commits 
git config --global user.email "$email"  # shown on commits, use work email on work machines
git config --global push.autoSetupRemote true  # auto-set upstream on first push of a new branch
git config --global init.defaultBranch main  # new repos default to "main"
git config --global credential.helper store  # cache HTTPS credentials (if you ever clone via HTTPS)
git config --global alias.lol "log --graph --oneline --decorate --color --branches origin/main"
```

## 7. GitHub CLI

Docs: https://cli.github.com/manual/

```fish
brew install gh
gh auth login
```

**Manual step:** Browser auth

## 8. Cask apps

```fish
brew install --cask ghostty background-music 1password 1password-cli mouseless rectangle google-chrome dropbox parsec
```

### 8.1. Work-related casks

```fish
brew install --cask docker-desktop slack postman
```

App docs: [Docker Desktop](https://www.docker.com/products/docker-desktop) · [Ghostty](https://ghostty.org/) · [Background Music](https://github.com/kyleneideck/BackgroundMusic) · [1Password CLI](https://developer.1password.com/docs/cli) · [Mouseless](https://mouseless.click/) · [Rectangle](https://rectangleapp.com/)

**Manual steps:**
- Launch Docker Desktop once to finish setup ([docs](https://docs.docker.com/desktop/setup/install/mac-install/)).
- Open Mouseless from Spotlight, grant Accessibility permission, add as login item ([docs](https://mouseless.click/)).
- Open Rectangle, grant Accessibility permission ([docs](https://rectangleapp.com/)).

## 9. Node.js / corepack / pnpm

Docs: https://nodejs.org/ · corepack: https://github.com/nodejs/corepack · pnpm via corepack: https://pnpm.io/installation#using-corepack

```fish
brew install node  # also provides corepack
corepack enable  # pnpm/yarn shims auto-install per-project
```

If corepack is outdated:

```fish
npm install -g corepack@latest
corepack enable
```

## 10. Python

Docs: https://docs.astral.sh/uv/

```fish
brew install python uv  # uv: fast pip/venv replacement
```

## 11. Claude Code

Docs: https://code.claude.com/docs/en/setup

```fish
curl -fsSL https://claude.ai/install.sh | bash  # installs to ~/.local/bin, auto-updates
```
