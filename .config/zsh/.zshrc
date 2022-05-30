#! /usr/bin/bash

# Setup TTY theme
source $DOT/themes/dracula-tty

# Set up the prompt
eval "$(starship init zsh)"

# History in cache directory
HISTFILE=$HOME/.cache/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt auto_cd
unsetopt correct_all

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Vim mode
bindkey -v
# export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change Cursor in Vim mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Plugins
[ -f "$DOT/.config/zsh/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh" ] && source $DOT/.config/zsh/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f "$DOT/.config/zsh/zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] && source $DOT/.config/zsh/zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ -f "$DOT/.config/zsh/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ] && source $DOT/.config/zsh/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[ -f "$DOT/.config/zsh/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh" ] && source $DOT/.config/zsh/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh

# Aliasrc
[ -f "$DOT/.config/zsh/aliasrc" ] && source $DOT/.config/zsh/aliasrc

# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "$HOME/Application/kitty/shell-integration/kitty.zsh"; then source "$HOME/Application/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION
