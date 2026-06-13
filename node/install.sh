#!/usr/bin/env bash
#
# Node + corepack-managed pnpm/yarn.
# Docs: https://github.com/nodejs/corepack · https://pnpm.io/installation#using-corepack

set -e

brew install node  # also provides corepack
corepack enable    # pnpm/yarn shims auto-install per-project

# if corepack is outdated: npm install -g corepack@latest && corepack enable
