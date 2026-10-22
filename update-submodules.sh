#! /usr/bin/env bash

echo "---> Updating whitesur-kde submodule..."
cd ./whitesur-kde/
git fetch origin master
git pull origin master
cd ..
echo "Done"

echo "---> Updating whitesur-icon-theme submodule..."
cd ./whitesur-icon-theme/
git fetch origin master
git pull origin master
cd ..
echo "Done"

echo "---> Updating MacTahoe-icon-theme submodule..."
cd ./MacTahoe-icon-theme/
git fetch origin main
git pull origin main
cd ..
echo "Done"

echo "---> Updating MacTahoe-kde submodule..."
cd ./MacTahoe-kde/
git fetch origin main
git pull origin main
cd ..
echo "Done"

cd ./.config/zsh/zsh_plugins

echo "Updating fast-syntax-highlighting..."
cd ./fast-syntax-highlighting
git fetch origin master
git pull origin master
cd ..
echo "Done"

echo "Updating fzf-tab..."
cd ./fzf-tab
git fetch origin master
git pull origin master
cd ..
echo "Done"

echo "Updating zsh-autosuggestions..."
cd ./zsh-autosuggestions
git fetch origin master
git pull origin master
cd ..
echo "Done"

echo "Updating zsh-ls-colors..."
cd ./zsh-ls-colors
git fetch origin master
git pull origin master
cd ..
echo "Done"
