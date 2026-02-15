#!/bin/bash
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    echo "Adding multilib"
    sudo sed -i '/^#\[multilib\]/,+1 s/^#//' /etc/pacman.conf
    echo "Multilib added"
    sudo pacman -Syu
fi

sudo pacman -Syu hyprland kitty noto-fonts dolphin discord steam grim slurp pipewire wireplumber waybar xdg-desktop-portal-hyprland wofi  qt6-wayland nvim hyprpaper hyprlock code zsh

mkdir -p ~/Downloads

cd ~/Downloads || exit
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
cd ~
paru -Syu zen-browser-bin osu-lazer-bin zig

cd ~/Downloads
git clone https://codeberg.org/fairyglade/ly.git
cd ly/
zig build
sudo zig build installexe -Dinit_system=systemd
systemctl enable ly@tty2.service


cd ~



mkdir -p ~/.config

ln -s ~/desktopDotfiles/hypr ~/.config
ln -s ~/desktopDotfiles/waybar ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sf ~/desktopDotfiles/.zshrc ~
source /.zshrc
chsh -s zsh $(which zsh)
