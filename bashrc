[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.aliases.sh ] && source ~/.aliases.sh
[ -f ~/.env_vars.sh ] && source ~/.env_vars.sh

export PATH=~/bin:${PATH}

export EDITOR=$(which vim)

COLOR_NC='\e[0m' # No Color
COLOR_WHITE='\e[1;37m'
COLOR_BLACK='\e[0;30m'
COLOR_BLUE='\e[0;34m'
COLOR_LIGHT_BLUE='\e[1;34m'
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\e[1;32m'
COLOR_CYAN='\e[0;36m'
COLOR_LIGHT_CYAN='\e[1;36m'
COLOR_RED='\e[0;31m'
COLOR_LIGHT_RED='\e[1;31m'
COLOR_PURPLE='\e[0;35m'
COLOR_LIGHT_PURPLE='\e[1;35m'
COLOR_BROWN='\e[0;33m'
COLOR_YELLOW='\e[1;33m'
COLOR_GRAY='\e[0;30m'
COLOR_LIGHT_GRAY='\e[0;37m'

function host_ps1() {
  if [ -n "$SSH_CLIENT" ]; then
    echo -n -e " $COLOR_RED[r]$COLOR_NC"
  fi
}

function git_status() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
    echo -n " | "
    echo -n -e "$COLOR_CYAN"
    echo -n "$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    echo -n -e "$COLOR_NC"
    if [[ $(git diff --shortstat | tail -n1) != "" ]]; then
      echo -n -e " $COLOR_RED*$COLOR_NC"
    fi
    if [[ $(git status --porcelain | grep "^??" | wc -l | tr -d " ") != "0" ]]; then
      echo -n -e " $COLOR_RED+$COLOR_NC"
    fi
  fi
}

export PS1=""
export PS1+="$COLOR_WHITE"
export PS1+='\t'
export PS1+="$COLOR_NC"
export PS1+=" "
export PS1+="|"
export PS1+=" "
export PS1+="$COLOR_YELLOW"
export PS1+='\u'
export PS1+="$COLOR_NC"
export PS1+=" "
export PS1+='@'
export PS1+=" "
export PS1+="$COLOR_BLUE"
export PS1+='\h'
export PS1+='$(host_ps1)'
export PS1+="$COLOR_NC"
export PS1+=" "
export PS1+='/'
export PS1+=" "
export PS1+="$COLOR_GREEN"
export PS1+='\w'
export PS1+="$COLOR_NC"
export PS1+='$(git_status)'
export PS1+=" "
export PS1+='\n'
export PS1+='\$'
export PS1+=" "
