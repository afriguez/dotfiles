#!/bin/bash
sudo pacman -S --needed xorg xorg-xinit nnn chromium kitty git base-devel feh picom pulseaudio pavucontrol

# AUR
git clone https://aur.archlinux.org/yay-git.git ~/yay
cd $HOME/yay && makepkg -si
yay -S pfetch

echo "Installing Window Manager..."
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME submodule update --init --recursive
cd $HOME/.config/dwm/
sudo make clean install

echo "Installing Dynamic Menu..."
cd $HOME/.config/dmenu/
sudo make clean install


echo "Installing node version manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
