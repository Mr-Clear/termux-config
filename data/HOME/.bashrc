# ~/.bashrc: executed by bash(1) for non-login shells.

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

: ${HOSTNAME:=$(getprop ro.product.device)}
: ${HOSTNAME:=android}
export HOSTNAME

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# timestamp history entries
HISTTIMEFORMAT='%F %T '

# set history length
HISTSIZE=1000
HISTFILESIZE=2000

# automatically prepend `cd` when entering just a path in the shell
shopt -s autocd

# allow cd to use variables as arguments
shopt -s cdable_vars

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# save each line of a multi-line command in the same history entry
shopt -s cmdhist

# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories
shopt -s globstar

# append to the history file, don't overwrite it
shopt -s histappend

# attempt to perform hostname completion for words containing '@'
shopt -s hostcomplete

# make less more friendly for non-text input files
[[ -x /usr/bin/lesspipe ]] && eval "$(lesspipe)"

# enable colorful terminal
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]${HOSTNAME:=$(hostname)}\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]${USER:=$(id \-un)}@${HOSTNAME:=$(hostname)}\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# alias definitions
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

resize >/dev/null
