# Automatically start X on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh history and histfile
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Default editor
bindkey -e

# Compinstall autocompletion
zstyle :compinstall filename '/home/adam/.zshrc'
autoload -Uz compinit
compinit

# Add stuff to PATH

# Load Antigen
source "$HOME/antigen.zsh"

# Load Antigen configurations
antigen init $HOME/.antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
# git
alias dot="/usr/bin/git --git-dir=$HOME/.dotbare/ --work-tree=$HOME"
