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
lnif $DOTFILESDIR/bash/.inputrc $HOME/.inputrc

# Git
echo "Setting up Git..."
lnif $DOTFILESDIR/git/.gitconfig $HOME/.gitconfig
lnif $DOTFILESDIR/git/.gitconfig_private $HOME/.gitconfig_private
# Check if git completion is set up
# TODO: update to support non-intel macs
if [ ! -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  mkdir -p /usr/local/etc/bash_completion.d
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /usr/local/etc/bash_completion.d/git-completion.bash
fi
if [ ! -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# Tmux
echo "Setting up Tmux..."
lnif $DOTFILESDIR/tmux/.tmux.conf $HOME/.tmux.conf
lnif $DOTFILESDIR/tmux/.tmux.reset.conf $HOME/.tmux.reset.conf
if [ ! -e $HOME/.tmux/plugins/ ]; then
  mkdir -p $HOME/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


# Vi
echo "Setting up Vi..."
lnif $DOTFILESDIR/vi/.vimrc $HOME/.vimrc
# Check if theme is installed
if [ ! -f $HOME/.vim/colors/badwolf.vim ]; then
  mkdir -p $HOME/.vim/colors
  curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim > $HOME/.vim/colors/badwolf.vim
fi

# Node.js
command -v node >/dev/null 2>&1 && {
	echo >&2 "Setting up Node.js"
	lnif $DOTFILESDIR/nodejs/.eslintrc $HOME/.eslintrc
	lnif $DOTFILESDIR/nodejs/.default-npm-packages $HOME/.default-npm-packages
	lnif $DOTFILESDIR/nodejs/.ncurc.json $HOME/.ncurc.json
	$DOTFILESDIR/nodejs/npm-global.sh
}
