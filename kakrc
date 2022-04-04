i#########################
# Plugins

# plug.kak
evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
    [ ! -e "$plugins/plug.kak" ] && \
        git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload

# other plugins
plug "raiguard/one.kak" theme


#########################


#colorscheme tomorrow-night
colorscheme one-darker

set-option global tabstop 4
set-option global indentwidth 4

set-option global scrolloff 15,10

# highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error

# soft-wrap long lines
add-highlighter global/ wrap -word -indent

add-highlighter global/ number-lines -hlcursor

#########################

# ; is easier than shift-; (for :)
map -docstring "command palette" global normal \; ":"

# space is our fearless leader
map -docstring "leader" global normal <space> ,

map -docstring "save" global user w ":write<ret>"
map -docstring "quit" global user q ":quit<ret>"
map -docstring "save and quit" global user x ":write; quit<ret>"

# might be nice to get <c-c> as esc back some day~
#map -docstring "ctrl-c to esc" global insert <c-c> "exec <esc>"

# missing mappings
# f -> format
# z -> fzf
# ? -> mdut
