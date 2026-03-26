#! /usr/bin/bash

# Install packages
sudo pacman -S \
	stow btop bat mpv lua luarocks yazi eza highlight kitty starship rclone zsh jq zoxide \
	chromium vivaldi vivaldi-ffmpeg-codecs firefox-developer-edition \
	neovim fzf fd ripgrep nodejs npm luarocks xclip python-pynvim python-pip \
	lazygit docker docker-compose docker-buildx go rustup \
	ttf-firacode-nerd noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd \
	qbittorrent yt-dlp gparted \
	fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-unikey uv bun

# Install yay packages
yay -S \
	rxfetch visual-studio-code-bin microsoft-edge-stable-bin \
	lazydocker-bin nvm zed-preview-bin apple-fonts

# Install NPM packages
sudo npm install -g neovim pnpm vercel

# Remove some default packages
sudo pacman -Rns firefox

# KDE
while true; do
	read -p "Do you want to install KDE packages? (y/n) " answer

	case $answer in
	y | Y)
		echo "Running the command..."

		sudo pacman -S dolphin-plugins kdeplasma-addons

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
