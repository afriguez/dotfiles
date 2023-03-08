#!/usr/bin/bash

set -e

sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort $HOME/pkglist.txt))

/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME submodule update --init --recursive

cd $HOME/.config/dwm/
sudo make clean install

cd $HOME/.config/dmenu/
sudo make clean install

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
