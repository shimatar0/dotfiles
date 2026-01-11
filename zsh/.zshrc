# alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

alias zshrc='vi ~/.zshrc'
alias history='history -n -r 1'

alias dc='docker compose'
alias d='docker'

alias k='kubectl'
alias kn='kubectl config set-context --current --namespace '

alias py='python3'
alias vi='nvim'

alias anti='open -a Antigravity'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

# zsh-autosuggestions color
export TERM=xterm-256color

# plugins
eval "$(sheldon source)"

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$gopath/bin

# Rust
source $HOME/.cargo/env

# e.g. uv
export PATH="$HOME/.local/bin:$PATH"

# fzf history
function fzf-select-history() {
    BUFFER=$(history | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# Added by Antigravity
export PATH="/Users/ka/.antigravity/antigravity/bin:$PATH"
