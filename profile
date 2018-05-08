#!/bin/bash
#
echo "reading profile"
#shopt -s checkwinsize

if [ ! -f "$HOME/.sessionkey" ] && [ -n "$BUDDY" ] ; then
echo $BUDDY >  ~/.buddy
SESSIONKEY=$(etcdctl get usr/${BUDDY}/session)
	if [ $? -eq 0 ] ; then
echo -n "$SESSIONKEY" > ~/.sessionkey
	fi
fi

if [ -f "$HOME/.sessionkey" ] ; then
	SESSIONKEY=$(cat ~/.sessionkey)
fi

function msgctrl {
    msgin="$1"
    BUDDY=$(cat ~/.buddy) || BUDDY="NOAUTH"
    tstamp=$(date +"%a %r")
    tsecs=$(date +"%s")
    mhost=$(hostname | cut -d '.' -f 1) || mhost=$(uname)
    kstoreput="curl -s -X PUT http://keystore:2379/v2/keys"
    kstoreget="curl -s -L http://keystore:2379/v2/keys"
    msgout="$mhost | $tstamp | $msgin"
	$kstoreput/stream -d value=\"${msgout}\" 
}
    
function yur_fckd {
    msgctrl "HACKER ATTACK !!! Break out attempt on container $(hostname), nice try $BUDDY "
}


tmux new -A -s SecLab 
