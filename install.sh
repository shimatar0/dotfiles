#!/bin/bash
set -e

echo '---------------------------------------------------'
echo ' Setting up dotfiles...'
echo '---------------------------------------------------'
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
rm nvim-macos-arm64.tar.gz

DOTPATH=$HOME/dev/src/dotfiles

ln -snfv "$DOTPATH/zsh/.zshrc" "$HOME/.zshrc"
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
echo 'brew'    
echo '***************************************************'    
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '---------------------------------------------------'
echo ' Dotfiles setup complete!'
echo '---------------------------------------------------'
