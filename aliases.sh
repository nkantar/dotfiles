# ls
if [[ $(uname) == "Darwin" ]] ; then
    alias ls="ls -G"
else
    alias ls="ls --color"
fi
alias cls="clear && ls"
alias lat="ls -lat"
alias clat="clear && ls -lat"
alias ll="ls -l"
alias cll="cls && ls -l"
alias cl="cd $1 && ls"

alias rcd="cd '`pwd`'"

#alias cdg="cd `git rev-parse --show-toplevel`"

alias rgp="rg -t py"
alias rgh="rg -t html"
alias rgj="rg -t js"

alias tarc="tar -cvzf"
alias tarx="tar -xvzf"

# applications

alias dcmp="docker-compose"
alias g="git"
alias p3="python3"
alias p="python"
alias v="vim"
alias nv="nvim"
alias va="vagrant"
alias ve3="python3 -m venv"
alias ve="virtualenv"
alias tf="terraform"

alias btoff="blueutil -p 0"
alias bton="blueutil -p 1"
alias btreset="btoff; bton"

alias ccat="pygmentize -O style=monokai -f console256 -g"
cless() { ccat $1 | less; }

alias relay="sgd run-ecs-task --cluster=sgd-relay-service --task=sgd-relay-service-production -e production --command=bash,./src/make_all_resources.sh --wait -s 1 -d 100000"
