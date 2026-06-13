#!/usr/bin/env bash
#
# (mostly) GUI apps.
# Docs: https://ghostty.org/ · https://github.com/kyleneideck/BackgroundMusic ·
# https://developer.1password.com/docs/cli · https://mouseless.click/ ·
# https://rectangleapp.com/

set -e

# --adopt: take ownership of an app that was previously installed by hand
brew install --cask --adopt ghostty
brew install --cask --adopt background-music
brew install --cask --adopt 1password
brew install --cask --adopt 1password-cli
brew install --cask --adopt mouseless
brew install --cask --adopt rectangle
brew install --cask --adopt google-chrome
brew install --cask --adopt dropbox
brew install --cask --adopt parsec
brew install --cask --adopt sublime-text
brew install --cask --adopt steam
