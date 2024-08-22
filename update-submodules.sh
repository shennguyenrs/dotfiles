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

echo "Updating zsh-you-should-use..."
cd ./zsh-you-should-use
git fetch origin master
git pull origin master
cd ..
echo "Done"
