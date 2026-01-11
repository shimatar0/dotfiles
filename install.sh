#!/bin/bash
set -e

echo '***************************************************'
echo 'brewがなかったらエラー'
echo '***************************************************'
if ! command -v brew &> /dev/null
then
    echo "Homebrew could not be found. Please install Homebrew first."
    exit 1
fi

echo '---------------------------------------------------'
echo ' Setting up dotfiles...'
echo '---------------------------------------------------'
# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
# tar xzf nvim-macos-arm64.tar.gz
# rm nvim-macos-arm64.tar.gz

DOTPATH=$HOME/dev/src/dotfiles

ln -snfv "$DOTPATH/zsh/.zshrc" "$HOME/.zshrc"

echo '---------------------------------------------------'
echo ' install Rust'
echo '---------------------------------------------------'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo '---------------------------------------------------'
echo ' Creating symlinks...'
echo '---------------------------------------------------'

mkdir -p "$HOME/.config/starship"
ln -snfv "$DOTPATH/starship/starship.toml" "$HOME/.config/starship.toml"

mkdir -p $HOME/.config/sheldon
ln -snfv "$DOTPATH/sheldon/plugins.toml" "$HOME/.config/sheldon/plugins.toml"

mkdir -p $HOME/.config/nvim
ln -snfv "$DOTPATH/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sv "$DOTPATH/nvim/lua" "$HOME/.config/nvim/"
ln -sv "$DOTPATH/nvim/lsp" "$HOME/.config/nvim/"

mkdir -p $HOME/.config/alacritty
ln -snfv "$DOTPATH/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

mkdir -p $HOME/.config/tmux
ln -snfv "$DOTPATH/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

echo '***************************************************'
echo ' Install sheldon plugins'
echo '***************************************************'
brew install sheldon

echo '---------------------------------------------------'
echo ' Dotfiles setup complete!'
echo '---------------------------------------------------'
