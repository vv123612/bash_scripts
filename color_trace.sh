#!/bin/bash

# https://stackoverflow.com/questions/26067916/colored-xtrace-output

RED=1
UNIQUE_STR='@@@'

COLOR=$RED

normal()
{
    tput sgr0 # tell the terminal to not style the output
}

colored()
{
    tput setaf $COLOR # tell the terminal to set forward color to $COLOR
}

export PS4="+${UNIQUE_STR}" # artificially insert $UNIQUE_STR to the trace
exec &> >(sed "s/\(\+\)*\+\(${UNIQUE_STR}\)\(.*\)$/$(colored)\1+\3$(normal)/") # see below
set -x # set trace
source "$@" # run the commands in the current shell so that all settings apply