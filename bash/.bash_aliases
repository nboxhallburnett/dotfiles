#   -----------------------------   #
#      COMMONLY USED FUNCTIONS      #
#   -----------------------------   #

alias ub=". ~/.bash_profile"
alias ebp="code ~/.bash_profile"
alias edf="code ~/Git/dotfiles/"
alias evi="vi ~/.vimrc"

# Make sure we're using the correct asdf binary
alias asdf="~/.asdf/bin/asdf"

# Shortcut for running curl with JSON headers
alias jsoncurl="curl -H \"Accept: application/json\" -H \"Content-Type: application/json\""

# Print out public ssh key
alias getPublicKey="cat ~/.ssh/id_rsa.pub"

alias sizeof="stat -f%z"

alias symlink="ln -s"

# Vi style exit for bash
alias :q="exit"

# Restart the bash process
alias rb="exec bash -l"
alias restart-bash="exec bash -l"

gg () {
    find . -name "*$2" -exec grep -color=always "$1" {} +
}

# Kill a process from its name
killX () {
    sudo kill -9 `ps -A | grep -m1 $1 | awk '{print $1}'`
}

#   -----------------------------   #
#      GO TO COMMON DIRECTORIES     #
#   -----------------------------   #

alias ~="cd ~"

#   -----------------------------   #
#           GIT SHORTCUTS           #
#   -----------------------------   #

alias g="git"
alias gm="git checkout package-lock.json ; git checkout master && git pull --tags --prune upstream master && git push origin master --no-verify && git fetch origin && npm i"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcam="git commit --amend -m"
alias gcb="git checkout -b"
alias grv="git remote -v"
alias gfu="git fetch upstream"
alias gmu="git merge upstream/master"
alias gs="git st"
alias gds="git diff -w --stat"
alias gdlc="git dsf --cached HEAD^ | less -SRc --tabs=4 --pattern '^(Date|added|deleted|modified): '"
alias gc="git checkout"
alias gl="git lds"
alias gb="git branch"
alias ga="git add"
alias gai="git add -i" # Interactive staging
alias pr="git pr"
alias pr-remote="git pr-remote"

# Pass the diff through less, so we get nice scrolling
gd() { git dsf $@ | less --tabs=4 -SRc --pattern '^(Date|added|deleted|modified|renamed): '; }
# Same as gd, but for the currently staged changes
gdc() { git dsf --cached $@ | less --tabs=4 -SRc --pattern '^(Date|added|deleted|modified|renamed): '; }

# Remove branches that have been merged into master, excluding master and the currently checked out branch
alias git-trim-branches="git branch --merged master | grep -v -e 'master' -e '\*' | xargs -n 1 git branch -d; git fetch --prune"
alias git-trim-remote-branches="git branch -r --merged | grep -v master | grep origin | sed 's/origin\///' | xargs -n 1 git push --delete origin"
alias gtb="git-trim-branches"

# Fix for "fatal: loose object {obj} (stored in ...) is corrupt" error
alias git-fix-corrupt-loose-object="find .git/objects/ -empty -delete"

# alias yolo="git add . && git commit -m \"$(curl -s whatthecommit.com/index.txt)\" && git push"

#   -----------------------------   #
#             FIX TYPOS             #
#   -----------------------------   #

alias ndoe="node"
alias noed="node"
alias onde="node"
alias ndoe="node"
alias ndeo="node"
alias noce="node"
alias nide="node"
alias nod="node"
alias noe="node"
alias ode="node"
alias nde="node"
alias nod="node"

alias nom="npm"

alias gti="git"
alias gut="git"

alias mogno="mongo"

#   -----------------------------   #
#       MAKE TERMINAL BETTER        #
#   -----------------------------   #

alias ls='ls -GFh'                          # Preferred 'ls' implementation
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FSRc --tabs=4'            # Preferred 'less' implementation
alias rm='/bin/rm -i'                       # Preferred 'rm' implementation
alias ll="ls -FGlAhp"                       # Shortcut for detailed 'ls' command
alias count="wc -l"                         # | count a command to return the line count of the output
cd() { builtin cd "$@" ; ll ; }             # Always list directory contents upon 'cd'
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias .....='cd ../../../../'               # Go back 4 directory levels
alias ......='cd ../../../../../'           # Go back 5 directory levels
alias .......='cd ../../../../../../'       # Go back 6 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias c='clear'                             # Clear terminal display
mcd () { mkdir -p "$1" && cd "$1" ; }       # Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null ; }   # Opens any file in MacOS Quicklook Preview

alias tree="tree -L 2 -C -I '.git|node_modules'"

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' | less -FSRXc ; }

#   -------------------------------   #
#      FILE AND FOLDER MANAGEMENT     #
#   -------------------------------   #

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)
makexmb () { mkfile "$1"m ./"$1"MB.dat ; }
alias makexmb=makexmb

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#   ---------------------------   #
#       PROCESS MANAGEMENT        #
#   ---------------------------   #

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }
freePort () { lsof -ti :"$@" | xargs kill -9 ; }


#   ---------------------------   #
#            NETWORKING           #
#   ---------------------------   #

alias myip='curl ip.appspot.com'                                            # myip:         Public facing IP Address
alias netCons='lsof -i'                                                     # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache; sudo killall -HUP mDNSResponder'   # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'                                     # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'                           # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'                           # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'                                      # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'                                      # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'                                # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                                          # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditional information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date:$NC " ; date
    echo -e "\n${RED}Machine stats:$NC " ; uptime
    echo -e "\n${RED}Current network location:$NC " ; scselect
    # echo -e "\n${RED}Public facing IP Address:$NC " ; myip
    # echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}


#   ---------------------------------------   #
#      SYSTEMS OPERATIONS & INFORMATION       #
#   ---------------------------------------   #

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
