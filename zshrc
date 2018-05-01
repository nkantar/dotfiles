[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.sh ] && source ~/.aliases.sh

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

export PATH="$PATH:/usr/local/bin:~/bin"

function cwd () { echo $(pwd); }
export PROMPT="
%F{magenta}%B%n%b%f %F{blue}@%f %F{green}%B%M%b%f %F{blue}/%f %F{yellow}%B%~%b%f
%F{red}%#%f %B"
