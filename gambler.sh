#!/bin/bash -x

stake=100
win=0
loss=0
bet=1
amount=0

		amount=stake
		while(( amount>0 ))			 # game starts
		do
			check=$[(RANDOM%2)]

			if (( check==1 ))			#won then adds bet 
			then
				amount=$[(amount+bet)]
			else							#loss then subtracts bet 
				amount=$[(amount-bet)]
			fi

			#now check 50% stake won or loss
			if (( amount == 150 )) 
			then							 #winning target reached
					((++win))
					break;
			elif (( amount == 50 ))
			then							#losing condition reached
					((++loss))
					break;
			fi

		done		#game ends

			echo $amount
