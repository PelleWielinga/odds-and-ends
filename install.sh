#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES_DIR/vim/.vim" "$HOME/.vim"

