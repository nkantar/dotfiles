[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.sh ] && source ~/.aliases.sh
[ -f ~/.env_vars.sh ] && source ~/.env_vars.sh

export PATH=~/bin:${PATH}
export PATH=/usr/local/bin:${PATH}

export EDITOR=$(which vim)

export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*"'

export HOMEBREW_NO_ANALYTICS=1

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

setopt PROMPT_SUBST
function git_status() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]];
    then
        echo -n " %F{yellow}|%f %F{cyan}"
        echo -n $(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if [[ $(git diff --shortstat | tail -n1) != "" ]];
        then
            echo -n " %F{red}*%f"
        fi
        if [[ $(git status --porcelain | grep "^??" | wc -l | tr -d " ") != "0" ]];
        then
            echo -n " %F{red}+%f"
        fi
        echo -n "%f"
    fi
}
export PROMPT="
%F{magenta}%B%n%b%f %F{yellow}@%f %F{green}%B%M%b%f %F{yellow}/%f %F{blue}%B%~%b%f\$(git_status)
%F{white}%B%#%b%f "
