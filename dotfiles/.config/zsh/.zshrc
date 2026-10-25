typeset -U path
path=("$HOME/.local/bin" $path)
export EDITOR=nvim
export VISUAL=nvim

zmodload zsh/complist
autoload -Uz compinit
compinit
_comp_options+=(globdots)
zstyle ':completion:*' menu select
zle_highlight=('paste:none')

setopt autocd nomatch auto_menu menucomplete interactive_comments globdots
setopt extendedglob auto_param_slash
setopt append_history share_history hist_ignore_dups hist_ignore_space
unsetopt prompt_sp
[[ -t 0 ]] && stty stop undef

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p -- "${HISTFILE:h}"
bindkey -v
KEYTIMEOUT=1

source "$ZDOTDIR/aliasrc"
source "$ZDOTDIR/prompt.zsh"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search
bindkey '^r' history-incremental-search-backward
bindkey '^[[P' delete-char

bindkey -M menuselect h vi-backward-char
bindkey -M menuselect j vi-down-line-or-history
bindkey -M menuselect k vi-up-line-or-history
bindkey -M menuselect l vi-forward-char

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

lfcd() {
    local tmp dir
    tmp=$(mktemp) || return

    {
        command lf -last-dir-path="$tmp" "$@" || return
        dir=$(<"$tmp")

        if [[ -d "$dir" && "$dir" != "$PWD" ]]; then
            cd -- "$dir"
        fi
    } always {
        command rm -f -- "$tmp"
    }
}

bindkey -s '^o' '^ulfcd^m'
bindkey -s '^f' '^ufg^m'
