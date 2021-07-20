# Set up the prompt
autoload -Uz promptinit
promptinit
prompt pure

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
export KEYTIMEOUT=1

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

# Aliasrc
[ -f "$HOME/.config/zsh/aliasrc" ] && source $HOME/.config/zsh/aliasrc

# Plugins
[ -f "$HOME/.cache/zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] && source $HOME/.cache/zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ -f "$HOME/.cache/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ] && source $HOME/.cache/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[ -f "$HOME/.cache/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh" ] && source $HOME/.cache/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh
[ -f "$HOME/.cache/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh" ] && source $HOME/.cache/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh

# Z lua
eval "$(lua $HOME/.cache/zsh_plugins/z.lua/z.lua --init zsh)"
