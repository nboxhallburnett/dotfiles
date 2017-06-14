#   -----------------------------   #
#              COLOURS              #
#   -----------------------------   #

# Foreground
BLACK='\e[30m'
BLUE='\e[34m'
GREEN='\e[32m'
CYAN='\e[36m'
RED='\e[31m'
PURPLE='\e[35m'
BROWN='\e[33m'
LIGHTGRAY='\e[90m'
DARKGRAY='\e[30m'
LIGHTBLUE='\e[34m'
LIGHTGREEN='\e[32m'
LIGHTCYAN='\e[36m'
LIGHTRED='\e[31m'
LIGHTPURPLE='\e[35m'
YELLOW='\e[33m'
WHITE='\e[37m'

# Background
BG_BLACK='\e[40m'
BG_RED='\e[41m'
BG_GREEN='\e[42m'
BG_YELLOW='\e[43m'
BG_BLUE='\e[44m'
BG_PURPLE='\e[45m'
BG_CYAN='\e[46m'
BG_WHITE='\e[47m'

BOLD='\e[1m'

# Reset
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
source /usr/local/etc/bash_completion.d/npm

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
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash
# jabba setup
[ -f $HOME/.jabba/jabba.sh ] && source $HOME/.jabba/jabba.sh
# travis setup
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
