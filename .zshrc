if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/rezwanarefin01/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZLE_RPROMPT_INDENT=0

plugins=(git git-extras gitignore python node npm pip django archlinux sudo jsontools autopep8 zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit && compinit

export PATH=$PATH:$HOME/.npm/bin

alias config='/usr/bin/git --git-dir=/home/rezwanarefin01/.dotfiles/ --work-tree=/home/rezwanarefin01'
