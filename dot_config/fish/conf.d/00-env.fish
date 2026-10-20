# Loaded before abbrs.fish, which uses $EDITOR.
set -gx EDITOR (which hx)
set -gx XDG_CONFIG_HOME "$HOME/.config"
