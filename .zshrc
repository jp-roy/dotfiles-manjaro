ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git rails gitfast asdf brew last-working-dir common-aliases sublime history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="./bin:./node_modules/.bin:/usr/local/bin:${PATH}"
