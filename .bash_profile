#
# ~/.bash_profile
#

export PATH=~/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH=$PATH:/home/fer/.spicetify
