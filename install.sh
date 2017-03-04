#!/usr/bin/env bash

DOTFILESDIR="$( cd $(dirname $0) ; pwd -P )"

# Create a symlink if the file doesn't exist already
lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

echo "Installing/Updating dotfiles..."

# Bash
echo "Setting up Bash..."
lnif $DOTFILESDIR/bash/.bash_profile $HOME/.bash_profile
lnif $DOTFILESDIR/bash/.bash_aliases $HOME/.bash_aliases
lnif $DOTFILESDIR/bash/.bash_private $HOME/.bash_private
lnif $DOTFILESDIR/bash/.bash_prompt $HOME/.bash_prompt

# Git
echo "Setting up Git..."
lnif $DOTFILESDIR/git/.gitconfig $HOME/.gitconfig
lnif $DOTFILESDIR/git/.gitconfig_private $HOME/.gitconfig_private

# Tmux
echo "Setting up Tmux..."
lnif $DOTFILESDIR/tmux/.tmux.conf $HOME/.tmux.conf
lnif $DOTFILESDIR/tmux/.tmux.reset.conf $HOME/.tmux.reset.conf

# Vi
echo "Setting up Vi..."
lnif $DOTFILESDIR/vi/.vimrc $HOME/.vimrc
# Create vim theme directory
mkdir -p $HOME/.vim/colors
# Install colour scheme
curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim > $HOME/.vim/colors/badwolf.vim
