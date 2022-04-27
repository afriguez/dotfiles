#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'

COLOR="\[$(tput setaf 213)\]"
RESET="\[$(tput sgr0)\]"

PS1="${COLOR}[\u@\h \W]\$${RESET} "

export EDITOR="nvim"

PF_ALIGN="10" PF_INFO="ascii title os kernel uptime pkgs" pfetch
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wper='feh --bg-scale --no-fehbg --randomize ~/Downloads/Wallpaper/*'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
