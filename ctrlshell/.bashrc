#!/bin/bash 
#

#-------------------------------------------------------------
export EDITOR=vim
alias vi='vim'

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------


# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
export CLICOLOR=1
export CLICOLOR_FORCE=G
#export LSCOLORS=ExFxBxDxCxegedabagacad
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export HISTFILESIZE=8192
export HISTSIZE=4096
#export HISTIGNORE="ls:cd*:pwd:ll:la:history:h:exit:"
export HISTIGNORE="exit"
alias clearhistory='echo clear > ~/.bash_history'



# User specific aliases and functions

export TZ='America/Toronto'

alias flc='fleetctl list-units --fields sub,unit,active,machine | sort -k 4 -g'
alias howis='fleetctl journal --lines 32'
alias trace='fleetctl journal --follow'
alias start='fleetctl start'
alias stop='fleetctl stop'
alias load='fleetctl load'
alias unload='fleetctl unload'
alias submit='fleetctl submit'
alias destroy='fleetctl destroy'

alias cleanscreen='reset ; resize'

reset
resize
#TermRecord -o /hack/index.html

echo "Starting human pre run interface" 
cat /etc/motd
echo 
echo "Interdimensional Portal starting $(hostname) service"
echo " . . . . . . . . . . . . . . . . . . . . . . . . . . "
echo
echo "Hit enter to attach. . . "
read junk
echo 
echo 
echo "Attaching to live session. . . "
#read whattodo
#if [ "${whattodo}" = "n" ] ; then
#echo "Ok then, goodbye."
# let the trap go

echo
export TERM=screen-256color


tmux new -A -s SecLab || { tmux attach -t SecLab ; }


