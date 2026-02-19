# ~/.config/zsh/.zshenv
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/.cargo/bin"
  /usr/local/bin
  /usr/local/sbin
  $path
)

export PATH