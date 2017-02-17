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

#alias cdg="cd `git rev-parse --show-toplevel`"

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

