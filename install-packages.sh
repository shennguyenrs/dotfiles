#! /usr/bin/bash

# Install packages
sudo pacman -S \
	stow btop bat mpv eza yazi highlight kitty starship rclone zsh jq \
	chromium vivaldi vivaldi-ffmpeg-codecs firefox-developer-edition \
	neovim fzf fd ripgrep nodejs npm luarocks xclip python-pynvim python-pip \
	lazygit docker docker-compose docker-buildx go rustup \
	ttf-firacode-nerd noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd \
	qbittorrent yt-dlp calibre gparted \
	fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-unikey uv

# Install yay packages
yay -S \
	rxfetch ngrok cloudflared-bin \
	postman-bin visual-studio-code-bin bun-bin \
	lazydocker-bin nvm zed-preview-bin \
	apple-fonts

# Install NPM packages
sudo npm install -g neovim pnpm vercel

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
