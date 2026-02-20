# ------------------------------------------------------------------------------
# General
# ------------------------------------------------------------------------------

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'

# Neovim
alias vi='nvim'
alias vim='nvim'

# Edit config
alias ec='nvim ~/.config'

# Smart edit function:
# - `e` with no args → open current directory
# - `e <dir>`        → open directory (netrw)
# - `e <file>`       → open file
function e() {
  if [[ $# -eq 0 ]]; then
    nvim .
  else
    nvim "$@"
  fi
}

# ------------------------------------------------------------------------------
# Git
# ------------------------------------------------------------------------------

alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git push'
alias gpl='git pull --rebase'
alias gl='git log --oneline --decorate --graph --all'
alias gundo='git reset --soft HEAD~1'

# ------------------------------------------------------------------------------
# Kubernetes
# ------------------------------------------------------------------------------

alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
alias k9='k9s'

# ------------------------------------------------------------------------------
# Docker
# ------------------------------------------------------------------------------

alias d='docker'
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'

# ------------------------------------------------------------------------------
# Terraform
# ------------------------------------------------------------------------------

alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# ------------------------------------------------------------------------------
# Python
# ------------------------------------------------------------------------------

alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv .venv'
alias act='source .venv/bin/activate'

# ------------------------------------------------------------------------------
# Rust / Cargo
# ------------------------------------------------------------------------------

alias c='cargo'
alias cb='cargo build'
alias cr='cargo run'
alias ct='cargo test'

# ------------------------------------------------------------------------------
# Safety improvements
# ------------------------------------------------------------------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'