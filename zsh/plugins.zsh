if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit load zsh-users/zsh-completions
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' menu select
_comp_options+=(globdots)

zinit light zdharma-continuum/fast-syntax-highlighting

zinit load zsh-users/zsh-autosuggestions

zinit load hlissner/zsh-autopair

zinit load zsh-users/zsh-history-substring-search

zinit load MichaelAquilina/zsh-you-should-use

zinit load changyuheng/zsh-interactive-cd

zinit load z-shell/history-search-multi-word
