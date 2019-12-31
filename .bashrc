#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
alias ls='ls --color=auto'
alias get_audio='youtube-dl --get-url -f 140'
alias l='ls'
alias tree='tree -A'
alias grep='grep --color=always'

export PS1="\[\033[38;5;220m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;27m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;40m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]{\[$(tput sgr0)\]\[\033[38;5;196m\]\$?\[$(tput sgr0)\]\[\033[38;5;15m\]} \[$(tput sgr0)\]"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
