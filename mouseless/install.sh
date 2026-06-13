#!/usr/bin/env bash
#
# Mouseless config (the cask itself is installed in apps/install.sh).
# The app is sandboxed, so the config is copied into its container rather
# than symlinked. If the live config has drifted from the repo (config is
# still evolving), it is NOT overwritten — capture it instead.

set -e

SRC="$(cd "$(dirname "$0")" && pwd -P)/config.yaml"
DST="$HOME/Library/Containers/net.sonuscape.mouseless/Data/.mouseless/configs/config.yaml"

if [ -f "$DST" ] && ! cmp -s "$SRC" "$DST"; then
  echo "  mouseless: live config differs from repo — not overwriting."
  echo "  capture it with: cp '$DST' '$SRC'  (then commit)"
else
  mkdir -p "$(dirname "$DST")"
  cp "$SRC" "$DST"
fi
