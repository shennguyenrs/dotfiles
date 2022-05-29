#!/usr/bin/bash

# Make sure to pulled in and update submodules
git submodule init
git submodule update

# Install vim-plug on new system
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
echo "--> Stowing directories"

for dir in ${directories[@]}; do
	stowit $dir
done

echo ""
echo "### ALL DONE ###"

