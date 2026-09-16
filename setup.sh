#!/usr/bin/bash

# Make sure to pulled in and update submodules
git submodule init
git submodule update

# Directories to installed on machine
config=(.config)
gemini=(.gemini)
agents=(.agents)
pi=(.pi)
global=(git tmux jetbrains)

# Run Stow command with location and directories
stowit() {
  loc=$1
  dir=$2
  # -v verbose
  # -R recursive
  # -t target
  stow -vRt ${loc} ${dir}
}

echo "--> Stowing .config directories"

for dir in ${config[@]}; do
  stowit $HOME/.config $dir
done

echo "--> Stowing .gemini directories"

for dir in ${gemini[@]}; do
  stowit $HOME/.gemini $dir
done

echo "--> Stowing .agents directories"

for dir in ${agents[@]}; do
  stowit $HOME/.agents $dir
done

echo "--> Stowing .pi directories"

for dir in ${pi[@]}; do
  stowit $HOME/.pi $dir
done

echo "---> Stowing global config"
for dir in ${global[@]}; do
  stowit $HOME $dir
done

echo "---> Update bat themes"
bat cache --build

echo "---> Install WhiteSur KDE theme"
while true; do
  read -p "Do you want to install WhiteSur KDE theme? [y/n] " answer
  case $answer in
  y | Y)
    cd ./whitesur-kde
    sh ./install.sh
    cd ..
    break
    ;;
  n | N) break ;;
  *) echo "Please answer yes or no." ;;
  esac
done

echo "---> Install WhiteSur Icons"
while true; do
  read -p "Do you want to install WhiteSur Icons? [y/n] " answer
  case $answer in
  y | Y)
    cd ./whitesur-icon-theme
    sh ./install.sh
    cd ..
    break
    ;;
  n | N) break ;;
  *) echo "Please answer yes or no." ;;
  esac
done

echo "---> Install MacTahoe Theme"
while true; do
  read -p "Do you want to install MacTahoe KDE theme? [y/n] " answer
  case $answer in
  y | Y)
    cd ./MacTahoe-kde/
    sh ./install.sh
    cd ..
    break
    ;;
  n | N) break ;;
  *) echo "Please answer yes or no." ;;
  esac
done

echo "---> Install MacTahoe Icons"
while true; do
  read -p "Do you want to install MacTahoe Icons? [y/n] " answer
  case $answer in
  y | Y)
    cd ./MacTahoe-icon-theme/
    sh ./install.sh
    cd ..
    break
    ;;
  n | N) break ;;
  *) echo "Please answer yes or no." ;;
  esac
done

echo "### ALL DONE ###"
