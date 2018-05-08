#!/bin/bash
#set -eo pipefail
set -a
PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH

if [ $# -eq 1 ];then
/usr/local/bin/ttyd -r 4 -p 3000 -S -C /efs/ca/local/local.cert.pem -K /efs/ca/local/local.key.pem exec tmux new -A -s $1 "bash -l" || { exec tmux attach -t $1 ; }
else
/usr/local/bin/ttyd -r 4 -p 3000 -S -C /efs/ca/local/local.cert.pem -K /efs/ca/local/local.key.pem exec tmux new -A -s SecLab "bash -l" || { exec tmux attach -t SecLab ; }
fi
