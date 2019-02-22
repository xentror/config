#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
alias ls='ls --color=auto'
alias get_audio='youtube-dl --get-url -f 140'
alias l='ls'
PS1='\[\e[92m\]vivi\[\e[93m\]@\h:\[\e[01;34m\]\W\[\e[39m\] # '
