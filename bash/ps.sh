#!/bin/bash

BLACK=0
RED=1
GREEN=2
YELLOW=3
BLUE=4
MAGENTA=5
CYAN=6
WHITE=7

NC="\[\e[0m\]"

GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"

__PW_PS1_CONNECT=""
__PW_PS1_CONNECT_OPEN=""

color() {
  local text_color=$1
  local background=$2
  local font_weight=$3

  if [ -z "$3" ]; then
    local font_weight=0
  fi

  if [ -z "$2" ]; then
    echo "\[\e[$font_weight;3${text_color}m\]"
  else
    echo "\[\e[$font_weight;4$background;3${text_color}m\]"
  fi
}

push_to_ps() {
  local text=$1
  local background=$2

  if [ -z "$__PW_PS1_CURRENT_BACKGROUND" ]; then
    __PW_PS1_CURRENT_BACKGROUND=$BLACK
  fi

  if [ -n "$PS1" ]; then
    if [ -z "$background" ] || [ "$background" == "$__PW_PS1_CURRENT_BACKGROUND" ]; then
      PS1="$PS1$__PW_PS1_CONNECT_OPEN"
    else
      PS1="$PS1$(color $__PW_PS1_CURRENT_BACKGROUND $background)$__PW_PS1_CONNECT$(color $BLACK $background)"
      __PW_PS1_CURRENT_BACKGROUND=$background
    fi
  elif [ -n "$background" ]; then
    PS1=$(color $BLACK $background)
    __PW_PS1_CURRENT_BACKGROUND=$background
  fi

  PS1="$PS1 $text "
}

finish_ps() {
  if [ -z "$__PW_PS1_CURRENT_BACKGROUND" ];then
    PS1="$PS1$__PW_PS1_CONNECT_OPEN "
  else
    PS1="$PS1$(color $__PW_PS1_CURRENT_BACKGROUND)$__PW_PS1_CONNECT $NC"
  fi
}

__prompt_command() {
  local EXIT="$?"
  local GIT="$(__git_ps1)"

  PS1=""

  if [ $EXIT != 0 ]; then
    push_to_ps "exit $EXIT" $RED
  fi

  if [ -n "$(jobs)" ]; then
    push_to_ps "⚠ " $YELLOW
  fi

  push_to_ps "\w" $BLUE

  if [ -n "$GIT" ]; then
    push_to_ps "$GIT" $GREEN
  fi

  finish_ps
}

PROMPT_COMMAND=__prompt_command
