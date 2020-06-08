#!/bin/bash -x

stake=100
win=0
loss=0

check=$[(RANDOM%2)]

	if(( check==1 ))
	then
		((++win))
	else
		((++loss))
	fi
