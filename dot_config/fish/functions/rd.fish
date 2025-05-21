function rd --description "Source Reach monorepo venv and change dir to project"
    set -l repo_root ~/src/reach_security
    set -l project $argv[1]
    set -l project_path $repo_root/$project
    set -l activate_venv venv/bin/activate.fish
    set -l tab_name $argv[2..-1]

    cd $repo_root
    if set -q TMUX_PANE
        tmux rename-window reach_security
    end
    source $activate_venv

    if not test -n "$argv[1]"
        echo "No project specified, changed directory to repo root."
        return 1
    end

    cd $project_path
    if set -q TMUX_PANE
        tmux rename-window $project

        if test -n "$argv[2]"
            tmux rename-window "$project: $tab_name"
        end
    end

    echo "Changed directory to $project."
end
