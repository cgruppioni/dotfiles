#!/bin/sh

set -e

latest_ruby_version="2.2.3"

echo "Installing Homebrew packages..."
brew update
brew tap homebrew/bundle
brew bundle
brew unlink qt 2>/dev/null || true
brew link --force qt5

echo "Linking dotfiles into ~..."
# Before `rcup` runs, there is no ~/.rcrc, so we must tell `rcup` where to look.
# We need the rcrc because it tells `rcup` to ignore thousands of useless Vim
# backup files that slow it down significantly.
RCRC=rcrc rcup -v

echo "Installing Vim packages..."
vim +PlugInstall +qa

echo "Disabling non-sandbox cabal installs..."
echo "require-sandbox: True" >> ~/.cabal/config

echo
echo "If you like what you see in system/osx-settings, run ./system/osx-settings"
echo "If you're using Terminal.app, check out the terminal-themes directory"

for setup in tag-*/setup; do
  source "$setup"
done
