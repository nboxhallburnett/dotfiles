#   -----------------------------   #
#              COLOURS              #
#   -----------------------------   #

BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;90m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m' # No Colour

#   -----------------------------   #
#              EXPORTS              #
#   -----------------------------   #

export PATH=$PATH:$HOME/Library/Android-SDK-macOSX/tools
export PATH=$PATH:$HOME/Library/Android-SDK-macOSX/platform-tools
export PATH=$PATH:$HOME/bin

export FIGNORE=.csproj:.meta

# Add GO to PATH
export GOPATH="$HOME/work"
export PATH="$PATH:$GOPATH/bin"

 # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS=ExFxBxDxCxegedabagacad
export BLOCKSIZE=1k

#   ------------------------------   #
#              SETTINGS              #
#   ------------------------------   #

shopt -s compat42
shopt -s promptvars
shopt -s cdspell
shopt -s autocd
shopt -s dirspell

#   -----------------------------   #
#              IMPORTS              #
#   -----------------------------   #

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

# bashrc
if [ -f ~/.bash_prompt ]; then
	source ~/.bash_prompt
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Private configs
if [ -f ~/.bash_private ]; then
	source ~/.bash_private
fi

# Input settings
if [ -f ~/.inputrc ]; then
	bind -f ~/.inputrc
fi

# asdf setup
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
