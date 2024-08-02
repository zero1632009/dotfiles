#!/bin/bash

# Check Sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo privileges"
  exit
fi

##### Install Package #####

# Print
echo -e "\e[32mInstall Package\e[0m"

# List Package
packages=(
	xorg
	xorg-xinit
	xf86-video-intel
	mesa
	vulkan-intel
	git
	neovim
	pulseaudio
	pavucontrol
	htop
	python-pywal
	ttf-jetbrains-mono-nerd
	fish
	clang
	lldb
	wget
	curl
	base-devel
	nitrogen
)

# Update System
sudo pacman -Syu --noconfirm

# Install Package
for package in "${packages[@]}"; do
        echo "Install Package: $package"
        sudo pacman -S --noconfirm $package
done

##### Setup Dwm #####
filewal = ~/.cache/wal/colors-wal-dwm.h
git clone https://github.com/zero1632009/wallpapers.git
wal -i ~/wallpapers/7.jpg
sed -i 's/SchemeUrg/SchemeSel/g' $filewal

git clone https://github.com/zero1632009/dotfiles.git
cd ~/dotfiles/dwm
sudo make install clean
cd ~/dotfiles/dmenu
sudo make install clean
cd ~/dotfiles/dwmblocks
sudo make install clean
cd
mkdir ~/.dwm
cp ~/dotfiles/dwm/autostart.sh ~/.dwm
cd

##### Setup Neovim ###

# Print
echo -e "\e[32mSetup Neovim\e[0m"

# Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Setup Neovim
mkdir ~/.config/nvim
echo "source ~/dotfiles/nvim/init.vim" >> ~/.config/nvim/init.vim

##### Setup Yay #####
cd
git clone https://aur.archlinux.org/yay.git
cd ~/yay
makepkg -si --noconfirm
cd
sudo rm -rf yay

##### Setup Shell #####
chsh -s /bin/fish

#### Setup Other #####
cd
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
makepkg -si -noconfirm
cd
sudo rm -rf google-chrome

##### Setup Xinit #####
cp /etc/X11/xinit/xinitrc ~/.xinitrc
filexinit = ~/.xinitrc
sed -i '51d' $filexinit
sed -i '52d' $filexinit
sed -i '53d' $filexinit
sed -i '54d' $filexinit
sed -i '55d' $filexinit
echo "exec dwm" >> $filexinit

reboot
