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

alias mkcd="mkdir -p $1 && cd $1"

#alias cdg="cd `git rev-parse --show-toplevel`"

alias cpwd="pwd | pbcopy"
alias cdirs="dirs | pbcopy"

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
alias va="vagrant"
alias ve3="python3 -m venv"
alias ve="virtualenv"
alias tf="terraform"
alias nv="nvim"
alias hostedit="sudo nvim /etc/hosts"

alias p2srv="python -m SimpleHTTPServer 8000"
alias p3srv="python3 -m http.server 8000"

alias btreset="blueutil -p 0 && blueutil -p 1"

alias ccat="pygmentize -O style=monokai -f console256 -g"
cless() { ccat $1 | less; }
