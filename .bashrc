#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add git-prompt script
source ~/git-prompt.sh

shopt -s checkwinsize
alias ls='ls --color=auto'
alias get_audio='youtube-dl --get-url -f 140'
alias l='ls'
alias tree='tree -A'
alias grep='grep --color=always'

export GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\e[92m\]vivi\[\e[93m\]@'\
'\[\e[01;34m\]\H:'\
'$(ret=$?; if [ $ret -ne 0 ]; then echo " \[\e[31;7m\]"$ret"\[\e[0m\]"; fi)'\
'\[\e[31;1m\]$(__git_ps1) '\
'\[\e[0m\]\w # '\

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
