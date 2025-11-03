#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable vi mode
set -o vi

# Make fzf use ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

# Aliasses
alias sudo='sudo '
alias pn=pnpm
# freeoffice aliasses
alias word=freeoffice-textmaker
alias excel=freeoffice-planmaker
alias ppt=freeoffice-presentations
# cursor ai
alias cursor-ai=$HOME/appimages/"cursor-0.45.14-build-250219jnihavxsz-x86_64.AppImage"
# windsurf
alias windsurf=$HOME/apps/Windsurf/windsurf
# postman 
alias postman=$HOME/appimages/Postman/Postman
# local mongod instance
alias mymongod="mongod --dbpath $HOME/.mongodb/mongodb/data/db"
# ls, grep color=auto
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# My Prompt
PS1='\[\e[1;35m\]\W\[\e[1;33m\] $(git branch 2>/dev/null | grep "*" | sed "s/*//")\[\e[1;31m\] ➜ \[\e[0m\]'
