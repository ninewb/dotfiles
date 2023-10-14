#                 ██
#  ██████  ██████░██
# ░░░░██  ██░░░░ ░██████
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░
#
#█▓▒░ lock the doors on the way out
#pkill gpg-agent ; pkill ssh-agent
[ -n "$(op account list)" ] && op signout --all
[ "$SHLVL" = 1 ] && [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
