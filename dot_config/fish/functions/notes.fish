function notes
    cd ~/src/notes

    if set -q TMUX_PANE
        tmux rename-window notes
    end

    hx
end
