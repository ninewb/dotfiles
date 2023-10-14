#                 ██
#  ██████  ██████░██
# ░░░░██  ██░░░░ ░██████
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░
#
#█▓▒░ clean home
export XDG_CONFIG_HOME="$HOME"/.config
export NAVE_DIR="$HOME"/.local/lib/nodejs
export CARGO_HOME="$HOME"/.local/lib/cargo
export RUSTUP_HOME="$HOME"/.local/lib/rustup
export GOPATH="$HOME"/.local/lib/go
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CACHE_HOME="$HOME"/.local/cache
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:=/tmp}"
export ZDOTDIR="$HOME"/.config/zsh
export GNUPGHOME="$XDG_DATA_HOME"/gpg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME"/npm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export KUBECONFIG="$XDG_CONFIG_HOME"/kube/config
export KUBECACHEDIR="$XDG_RUNTIME_DIR"/kube
export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship
export TFENV="$XDG_DATA_HOME"/terraform

#█▓▒░ paths
export PATH=/usr/sbin:/usr/local/sbin:$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$NPM_CONFIG_PREFIX/bin:$TFENV/bin:$XDG_DATA_HOME/nvim/mason/bin:$PATH

#█▓▒░ man
export MANPAGER='nvim --cmd ":lua vim.g.noplugins=1" +Man!'
export MANWIDTH=999

#█▓▒░ preferred text editor
export EDITOR=nvim
export VISUAL=nvim

#█▓▒░ fzf & clipboard menu
export CM_LAUNCHER="fzf"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#c1c1c1,bg:#2b2b2b,hl:#78824B --color=fg+:#ffffff,bg+:#1c1c1c,hl+:#C9A554 --color=info:#5f875f,prompt:#5f875f,pointer:#78824B --color=marker:#78824B,spinner:#78824B,header:#78824B --color=gutter:#2b2b2b,border:#222222 --padding=1 --prompt=❯ --marker=❯ --pointer=❯ --reverse'

#█▓▒░ language
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

#█▓▒░ no mosh titles
export MOSH_TITLE_NOPREFIX=1

#█▓▒░ gpg cli in the tty
GPG_TTY=$(tty)
export GPG_TTY
