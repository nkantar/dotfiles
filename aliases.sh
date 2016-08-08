# ls
alias ls="ls -G"
alias cls="clear && ls"
alias lat="ls -lat"
alias clat="clear && ls -lat"
alias ll="ls -l"
alias cll="cls && ls -l"

# applications
alias v='vim'
alias g='git'
alias p='python'
alias pi='pip'

# git
alias gitprune='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
alias gitfire='git checkout -b fire-`date +"%Y%m%d-%H%M%S"` && git add -A && git commit -am "The roof is on fire" && git push origin HEAD'

