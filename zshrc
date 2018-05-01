[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.sh ] && source ~/.aliases.sh

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end

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
