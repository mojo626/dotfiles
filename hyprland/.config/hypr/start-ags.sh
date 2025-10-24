#!/usr/bin/env bash
cd "$HOME/dotfiles/ags" || exit
nix develop -c ags run .