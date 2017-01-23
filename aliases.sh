# ls
if [[ $(uname) == 'Darwin' ]] ; then
    alias ls="ls -G"
else
    alias ls="ls --color"
fi
alias cls="clear && ls"
alias lat="ls -lat"
alias clat="clear && ls -lat"
alias ll="ls -l"
alias cll="cls && ls -l"

alias cdg="cd `git rev-parse --show-toplevel`"

alias cdsl="cd ~/Projects/SimpleLegal"
alias cdeb="cd ~/Projects/SimpleLegal/ebill"
alias cdvp="cd ~/Projects/SimpleLegal/vendorportal"
alias slv="cd ~/Projects/SimpleLegal && vim ."

alias agp="ag --python"
alias agh="ag --html"
alias agj="ag --js"

# applications

alias v='vim'
alias va='vagrant'
alias g='git'
alias p='python'
alias p3='python3'
alias ve='virtualenv'
alias ve3='python3 -m venv'
alias dcmp='docker-compose'

alias jd='jotdown'

# git
alias gitprune='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
alias gitfire='git checkout -b fire-`date +"%Y%m%d-%H%M%S"` && git add -A && git commit -am "The roof is on fire" && git push origin HEAD'

