set -l list (find ~/src/reach_security -not -path '*/.*' -maxdepth 1 -type d -exec basename {} \;)

complete -f -c rd -a "$list"
