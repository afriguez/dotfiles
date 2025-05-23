#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
alias nnn='nnn -d -e -H -r'
alias cat='bat --theme Dracula'
alias cdw='cd $HOME/workspace/ && nnn'
alias cdf='cd $(find ~/ -type d | fzf)'

COLOR="\[$(tput setab 98)\]"
COLOR_FG="\[$(tput setaf 98)\]"
RESET="\[$(tput sgr0)\]"

PS1="${COLOR} \u@\h \W ${RESET}${COLOR_FG}${RESET} "

export EDITOR="nvim"

PF_ALIGN="10" PF_INFO="ascii title os kernel uptime pkgs" pfetch
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

img=$(/usr/bin/ls $HOME/Downloads/Wallpaper | sort -R | head -1)
img_path=$HOME/Downloads/Wallpaper/reimu1.jpg

LAST_REPO=""
cd() {
    builtin cd "$@";
    git rev-parse 2>/dev/null;

    if [ $? -eq 0 ]; then
        if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
		onefetch -d dependencies authors contributors license -i $img_path --image-protocol kitty
        LAST_REPO=$(basename $(git rev-parse --show-toplevel))
        fi
    fi
}
export PATH=$PATH:/home/fer/.spicetify

# Created by `pipx` on 2024-01-10 20:44:24
export PATH="$PATH:/home/fer/.local/bin"
