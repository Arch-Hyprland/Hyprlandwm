# -----------------------------------------------------
# INIT
# -----------------------------------------------------

set -U fish_greeting ""

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
export EDITOR=nvim

set -U fish_user_paths "/usr/lib/ccache/bin/"
set -U fish_user_paths "$fish_user_paths" "~/.cargo/bin/"
set -U fish_user_paths "$fish_user_paths" "~/.local/bin/"