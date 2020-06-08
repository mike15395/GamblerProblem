
#!/bin/bash -x

function gambler()
{

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
					echo "Day " $day "won " $win
					break;
			elif (( amount == 50 ))
			then							#losing condition reached
					((++loss))
					echo "Day " $day "loss " $loss
					break;
			fi

		done		#game ends

			total=$[(total+amount)]
			array[counter++]=$total
			echo "Day" $day "amount" $amount "TotalAmount" $total 
	done

						echo "TotalgamesWon=" $win  "Totalgameslost=" $loss

}
				#echo ${array[@]}


function monthly_calc()
{
			monthly_stake=3000
			if (( $win > $loss ))
			then
					diff=$[($total-$monthly_stake)]
					echo "Won by" $diff

					echo "1.Continue gambling"
					echo "2.Stop"
					echo "Enter your choice"
					read choice

					case $choice in 
										1 ) 
												gambler
												;;
										2 )
												exit 0
												;;

					esac


			elif (( $loss > $win ))
			then
					diff=$[(monthly_stake-total)]
					echo "Lost by" $diff
			else
					echo "Draw"
			fi


}

gambler
monthly_calc
