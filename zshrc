[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.sh ] && source ~/.aliases.sh
[ -f ~/.env_vars.sh ] && source ~/.env_vars.sh

export PATH=~/bin:${PATH}

# Created by `userpath` on 2020-12-07 20:34:49
export PATH="$PATH:/Users/nik/.local/bin"
export PATH="$PATH:/usr/local/opt/python@3.8/bin"

export EDITOR=$(which nvim)

eval "$(starship init zsh)"

. /usr/local/opt/asdf/asdf.sh
