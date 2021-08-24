#!/usr/bin/bash

# Make sure to pulled in and update submodules
git submodule init
git submodule update

# Directories to installed on machine
directories=(
	.config
)

# Run Stow command with $HOME and directories
stowit() {
	dir=$1
	# -v verbose
	# -R recursive
	# -t target
	stow -vRt $HOME/.config ${dir}
}

echo ""
echo "--> Stowing directories for user: ${whoiam}"

for dir in ${directories[@]}; do
	stowit $dir
done

echo ""
echo "### ALL DONE ###"

