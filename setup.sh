#!/usr/bin/bash

# Make sure to pulled in and update submodules
git submodule init
git submodule update

# Directories to installed on machine
config=(.config)
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

echo ""
echo "--> Stowing .config directories"

for dir in ${config[@]}; do
	stowit $HOME/.config $dir
done

echo "---> Stowing global config"
for dir in ${global[@]}; do
	stowit $HOME $dir
done

echo "---> Update bat themes"
bat cache --build

echo "---> Install WhiteSur KDE theme"
cd ./whitesur-kde
sh ./install.sh
cd ..

echo "---> Install WhiteSur Icons"
cd ./whitesur-icon-theme
sh ./install.sh
cd ..

echo ""
echo "### ALL DONE ###"
