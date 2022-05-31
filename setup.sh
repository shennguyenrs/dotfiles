#!/usr/bin/bash

# Make sure to pulled in and update submodules
git submodule init
git submodule update

# Install vim-plug on new system
VIPLUG=$HOME/.local/share/nvim/site/autoload/plug.vim

if ! [[ -f  $VIPLUG ]]; then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
				 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Directories to installed on machine
config=( .config )
global=( git tmux )

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

