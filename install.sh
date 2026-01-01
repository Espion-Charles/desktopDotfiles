#!/bin/bash

sudo pacman -S hyprland kitty noto-fonts dolphin discord steam grim slurp pipewire wireplumber quickshell xdg-desktop-portal-hyprland wofi okular qt6-wayland nvim hyprpaper hyprlock code zsh

mkdir -p ~/Downloads

cd ~/Downloads || exit
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si

cd ~

paru -Syu zen-browser-bin osu-lazer-bin 

mkdir -p ~/.config

ln -s ~/desktopDotfiles/hypr ~/.config
ln -s ~/desktopDotfiles~/quickshell ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sf ~/desktopDotfiles/.zshrc ~
source /.zshrc
chsh -s zsh $(which zsh)