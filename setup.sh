#!/usr/bin/bash

# Make sure to pulled in and update submodules
git submodule init
git submodule update

# Install packer on new system

# Directories to installed on machine
config=( .config )
global=( git tmux jetbrains )

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

echo ""
echo "### ALL DONE ###"

