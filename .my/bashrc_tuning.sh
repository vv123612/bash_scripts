#https://losst.ru/istoriya-komand-linux

#########################################################################
#settings for virtualwrapper
export WORKON_HOME=~/projects/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
#source /home/vitaly/.local/bin/virtualenvwrapper.sh
#source /usr/local/bin/virtualenvwrapper.sh
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
#export VIRTUALENVWRAPPER_VIRTUALENV=/home/vitaly/.local/bin/virtualenv
#########################################################################


#########################################################################
#aliases
alias h='history'
alias d='docker'

if [ -f ~/.my/docker_aliases.sh ]; then
    source ~/.my/docker_aliases.sh
fi


#########################################################################




#########################################################################
#history settings
#vim ~/.bashrc

#common history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r;"

#exclude duplicates
export HISTCONTROL=ignoredups

#output format
export HISTTIMEFORMAT='%F %T '
#########################################################################


