# source ~/.env_vars.sh

set PATH $PATH /opt/homebrew/bin
set PATH $PATH ~/bin

set -Ux EDITOR (which hx)

set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Created by `pipx` on 2021-12-15 08:09:28
set PATH $PATH /Users/nik/.local/bin

set DOTFILES ~/.dotfiles

set XDG_CONFIG_HOME "$HOME/.config"

eval "$(atuin init fish)"
