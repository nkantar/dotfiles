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

alias cdapps="cd ~/Projects/apps"
alias cddevops="cd ~/Projects/devops"
alias cddocs="cd ~/Projects/devdocs"

alias bpg="pg_ctl -D /usr/local/var/postgres"

alias agp="ag --python"
alias agh="ag --html"
alias agj="ag --js"

alias rgp="rg -t py"
alias rgh="rg -t html"
alias rgj="rg -t js"

alias tarc="tar -cvzf"
alias tarx="tar -xvzf"

# applications

alias dcmp='docker-compose'
alias g='git'
alias nv='nvim'
alias p3='python3'
alias p='python'
alias v='vim'
alias va='vagrant'
alias ve3='python3 -m venv'
alias ve='virtualenv'

alias ccat='pygmentize -O style=monokai -f console256 -g'
cless() { ccat $1 | less }

