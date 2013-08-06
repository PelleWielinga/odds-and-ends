#!/bin/bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'

HISTSIZE=10000
HISTFILESIZE=20000

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Show differences in colour
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Some shortcuts for different directory listings
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls -h --color=auto'                 # classify files in colour
alias ll='ls -lA'                             # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -C'                               #

# Use vim rather than vi
alias vi='vim'

# Set PS1 of the command line
if [ -f "${HOME}/.setps" ]; then
	source "${HOME}/.setps"
fi
