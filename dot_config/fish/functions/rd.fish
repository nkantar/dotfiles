function rd --description "Source Reach monorepo venv and change dir to project"
    set -l repo_root ~/src/reach_security
    set -l project $argv
    set -l project_path $repo_root/$project
    set -l activate_venv venv/bin/activate.fish

    cd $repo_root
    tmux rename-window reach_security
    source $activate_venv

    if not test -n "$argv"
        echo "No project specified, changed directory to repo root."
        return 1
    end

    cd $project_path
    tmux rename-window $project

    echo "Changed directory to $project."
end
