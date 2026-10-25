autoload -Uz vcs_info add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{#a0a0a0}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{#a0a0a0}%b|%a%f'

precmd_vcs_info() {
    vcs_info
}

add-zsh-hook precmd precmd_vcs_info
PROMPT='%F{#a0a0a0}%n@%m%f %F{#ffc799}%~%f${vcs_info_msg_0_}'
PROMPT+=$'\n'
PROMPT+='%(!.%F{#f5a191}#.%F{%(?.#ffc799.#f5a191)}>)%f '
