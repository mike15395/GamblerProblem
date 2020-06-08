#!/bin/bash -x

stake=100
win=0
loss=0
bet=1
amount=0
total=0

declare -a array
counter=1

	for (( day=1; day<=30 ; day++ ))
	do
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

			total=$[(total+amount)]
			array[counter++]=$total
			#echo "Day" $day "amount" $amount "TotalAmount" $total "wins" $win "loss" $loss
	done

				echo ${array[@]:1:20}

