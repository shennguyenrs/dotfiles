# My Dotfiles Config

Settings including:

- Neovim & LSP
- Kitty
- Mpv
- Zsh
- Lf
- Tmux
- JetBrains Ideavimrc
- Rclone to sync wallpapers & books between Google Drive & local

Ensure to install:

- NodeJs & NPM
- Python & PIP
- Luarocks
- FZF
- Xclip (Neovim)
- Packer (Neovim)

Sample .zshenv:

```bash
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/vivaldi
export DOT=

# PATH
export PATH=$PATH:"$HOME/.local/bin"

# API keys
```
