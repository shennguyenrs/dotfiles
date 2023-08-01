#! /usr/bin/bash

# Install packages
sudo pacman -S \
  stow btop bat mpv exa ranger highlight kitty starship dolphin-plugins flameshot rclone zsh kdeplasma-addons \
  vivaldi vivaldi-ffmpeg-codecs \
  neovim fzf fd ripgrep nodejs npm luarocks xclip python-neovim \
  lazygit docker docker-compose \
  ttf-firacode-nerd noto-fonts-cjk noto-fonts-emoji \
  ktorrent \
  yt-dlp \

# Install yay packages
yay -S \
  google-chrome-dev firefox-developer-edition telegram-desktop-bin-dev \
  postman-bin visual-studio-code-bin \
  nvim-packer-git \
  lazydocker nvm \
  ttf-apple-fonts \
  ibus-bamboo-git ibus-autostart \
  latte-dock-git plasma5-applets-virtual-desktop-bar-git \
