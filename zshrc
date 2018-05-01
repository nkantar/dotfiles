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

setopt PROMPT_SUBST
function git_branch() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]];
    then
        echo -n " %F{yellow}|%f %F{cyan}"
        echo -n $(git rev-parse --abbrev-ref HEAD)
        echo -n "%f"
    fi
}
export PROMPT="
%F{magenta}%B%n%b%f %F{yellow}@%f %F{green}%B%M%b%f %F{yellow}/%f %F{blue}%B%~%b%f\$(git_branch)
%F{red}%#%f %B"
