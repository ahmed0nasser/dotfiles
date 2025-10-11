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

# My Exports
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/platform-tools

# My Aliasses
alias pn=pnpm
alias code=codium
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

# Add .NET Core SDK tools
export PATH=$PATH:$HOME/.dotnet/tools

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[1;35m\]\W\[\e[1;33m\] $(git branch 2>/dev/null | grep "*" | sed "s/*//")\[\e[1;31m\] ➜ \[\e[0m\]'
export PATH=$HOME/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/ahmed/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
