#!/bin/bash -x

stake=100
win=0
loss=0
bet=1
amount=0


		amount=stake
			 # game starts

			check=$[(RANDOM%2)]

			if (( check==1 ))			#won then adds bet amount
			then
				amount=$[(amount+bet)]
			else					#loss then subtracts bet amount
				amount=$[(amount-bet)]
			fi


