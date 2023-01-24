#!/usr/bin/env bash


# Levels of indirection and time
 ps4_my='+\011\[\e[3;34m\]\t\[\e[0m\]'
# User ID [Effective user ID]: Groups of user is a member
ps4_my+=' \[\e[0;35m\]$UID[$EUID]:$GROUPS\[\e[0m\] '
# Shell level and subshell
ps4_my+='\011\[\e[1;31m\]L$SHLVL:S$BASH_SUBSHELL\[\e[0m\]'
# Source file
ps4_my+=' \[\e[1;33m\]${BASH_SOURCE:-$0}\[\e[0m\]'
# Line number
ps4_my+='\[\e[0;36m\]#:${LINENO}\[\e[0m\]'
# Function name
ps4_my+='\011\[\e[1;32m\]${FUNCNAME[0]:+${FUNCNAME[0]}(): }\[\e[0m\]'
# Executed command
ps4_my+='\n# '

PS4=$ps4_my

set -eux

function print-msg () {
  printf '%b%-20s%b' "${colors[${1:-0}]}" "${@:2}" "${colors[0]}"
}

function random-color-echo() {
  print-msg $((1 + RANDOM % $((4 - 1)))) "${*:-}"
}

function msg () {
  random-color-echo "Hi ${*:-}!"
}

colors=(
  "$(tput sgr0)"    # reset
  "$(tput setaf 1)" # red
  "$(tput setaf 2)" # green
  "$(tput setaf 3)" # yellow
  "$(tput setaf 4)" # blue
)

for item in {"Bob","Alice"}; do
  echo "$({ msg "$item"; ( date '+%s%N' ); } & wait)"
done

echo 'Done'


