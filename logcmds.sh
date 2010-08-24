#!/bin/bash

LASTTIME=`date +"%s"`
function logit()
{
	if [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ]; then
		return;
	fi
	HIST=`history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`
	HIST2=`history 2 | head -n2 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`
	HIST3=`history 1 | head -n3 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`

	NOW=`date +"%s"`
	DELTAT=$(( $NOW - $LASTTIME ))
	LASTTIME=$NOW
	echo -e "$NOW\0$BASH_COMMAND\0$HIST\0$HIST2\0$HIST3\0$PWD\0$DELTAT" >> .histlog
}

trap "logit" DEBUG
