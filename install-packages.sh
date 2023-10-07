#! /usr/bin/bash

# Install packages
sudo pacman -S \
  stow btop bat mpv eza ranger highlight kitty starship dolphin-plugins flameshot rclone zsh kdeplasma-addons partitionmanager \
  chromium vivaldi vivaldi-ffmpeg-codecs \
  neovim fzf fd ripgrep nodejs npm luarocks xclip python-pynvim python-pip \
  lazygit docker docker-compose docker-buildx \
  ttf-firacode-nerd noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd \
  ktorrent kvantum-qt5 \
  yt-dlp \
  w3m imlib2 \

# Install yay packages
yay -S \
  firefox-developer-edition telegram-desktop-bin \
  postman-bin visual-studio-code-bin \
  nvim-packer-git \
  lazydocker-bin nvm \
  apple-fonts \
  ibus-bamboo-git ibus-autostart \
  latte-dock-git plasma5-applets-virtual-desktop-bar-git \

# Install NPM packages
sudo npm install -g neovim pnpm
