#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function safelink {
  FILE=$1
  LINK=$2

  echo "$LINK -> $FILE"
  if [ ! -e "$LINK" ]; then
    ln -s "$FILE" "$LINK"
  fi
}

safelink "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
safelink "$DOTFILES_DIR/vim/.vim" "$HOME/.vim"
safelink "$DOTFILES_DIR/vim/.vimperatorrc" "$HOME/.vimperatorrc"


