if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/usr/share/oh-my-zsh"
ZLE_RPROMPT_INDENT=0

plugins=(git git-extras gitignore python node npm pip django archlinux sudo jsontools autopep8)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit

export PATH=$PATH:$HOME/.npm/bin

alias config='/usr/bin/git --git-dir=/home/rezwanarefin01/.dotfiles/ --work-tree=/home/rezwanarefin01'

export XMONAD_CONFIG_DIR="$HOME/.config/xmonad"
