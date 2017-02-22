#!/bin/bash

# set -e

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$PROJECT_DIR/backup/$(date +%Y-%b-%d)"

echo
echo "!!! WARNING !!!"
echo 
echo "This script will overwrite some configuration files in your \$HOME folder"
echo "such as (but not limited to) .bashrc and .vimrc."
echo 
echo "The current versions of these files will be backed up here:"
echo "$BACKUP_DIR"
echo

mkdir -p "$BACKUP_DIR"

if [[ -h "$HOME/.bashrc" ]]; then
  rm "$HOME/.bashrc"
fi

if [[ -f "$HOME/.bashrc" ]]; then
  mv "$HOME/.bashrc" "$BACKUP_DIR/.bashrc"
fi

ln -s "$PROJECT_DIR/shell/.bashrc" "$HOME/.bashrc"



if [[ -h "$HOME/.profile" ]]; then
  rm "$HOME/.profile"
fi

if [[ -f "$HOME/.profile" ]]; then
  mv "$HOME/.profile" "$BACKUP_DIR/.profile"
fi

ln -s "$PROJECT_DIR/shell/.profile" "$HOME/.profile"



if [[ -h "$HOME/.bash_profile" ]]; then
  rm "$HOME/.bash_profile"
fi

if [[ -f "$HOME/.bash_profile" ]]; then
  mv "$HOME/.bash_profile" "$BACKUP_DIR/.bash_profile"
fi



if [[ -h "$HOME/.setenv" ]]; then
  rm "$HOME/.setenv"
fi

if [[ -f "$HOME/.setenv" ]]; then
  mv "$HOME/.setenv" "$BACKUP_DIR/.setenv"
fi

ln -s "$PROJECT_DIR/shell/.setenv" "$HOME/.setenv"



if [[ -h "$HOME/.setps" ]]; then
  rm "$HOME/.setps"
fi

if [[ -f "$HOME/.setps" ]]; then
  mv "$HOME/.setps" "$BACKUP_DIR/.setps"
fi

ln -s "$PROJECT_DIR/shell/.setps" "$HOME/.setps"



if [[ -h "$HOME/.vimrc" ]]; then
  rm "$HOME/.vimrc"
fi

if [[ -f "$HOME/.vimrc" ]]; then
  mv "$HOME/.vimrc" "$BACKUP_DIR/.vimrc"
fi

ln -s "$PROJECT_DIR/vim/.vimrc" "$HOME/.vimrc"



if [[ -h "$HOME/.vim" ]]; then
  rm "$HOME/.vim"
fi

if [[ -d "$HOME/.vim" ]]; then
  mv "$HOME/.vim" "$BACKUP_DIR/.vim"
fi

ln -s "$PROJECT_DIR/vim/.vim" "$HOME/.vim"



if [[ -h "$HOME/bin" ]]; then
  rm "$HOME/bin"
fi

if [[ -d "$HOME/bin" ]]; then
  mv "$HOME/bin" "$BACKUP_DIR/bin"
fi

ln -s "$PROJECT_DIR/bin" "$HOME/bin"



source "$HOME/.bashrc"

set +e

