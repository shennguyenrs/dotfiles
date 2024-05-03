#! /usr/bin/bash

# Install packages
sudo pacman -S \
	stow btop bat mpv eza lf highlight kitty starship rclone zsh \
	chromium vivaldi vivaldi-ffmpeg-codecs firefox-developer-edition \
	neovim fzf fd ripgrep nodejs npm luarocks xclip python-pynvim python-pip \
	lazygit docker docker-compose docker-buildx \
	ttf-firacode-nerd noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd \
	qbittorrent yt-dlp calibre

# Install yay packages
yay -S \
	rxfetch \
	telegram-desktop-bin \
	postman-bin visual-studio-code-bin bun-bin \
	nvim-packer-git \
	lazydocker-bin nvm \
	apple-fonts \
	anytype-bin microsoft-edge-dev-bin

# Install NPM packages
sudo npm install -g neovim pnpm

# KDE
while true; do
	read -p "Do you want to install KDE packages? (y/n) " answer

	case $answer in
	y | Y)
		echo "Running the command..."

		sudo pacman -S dolphin-plugins kdeplasma-addons partitionmanager

		echo "Finish installing packages"

		exit 0 # Exit with success code
		;;
	n | N)
		echo "Finish installing packages"
		exit 0 # Exit with success code
		;;
	*)
		echo "Invalid input. Please enter 'y' or 'n'."
		;;
	esac
done
