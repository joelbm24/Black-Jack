hit = 1
suits = [ "S|", "H|", "C|", "D|" ]
cards = (2..10).to_a.push('A', 'K', 'Q', 'J')
hand = Array.new
handVal = Array.new
faceVal = { '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, '10'=>10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }
deck = suits.collect { |suit| cards.collect { |card| suit.to_s + card.to_s } }.flatten

2.times { hand.push(deck[rand(52)]) }
puts hand.flatten
handVal.push(faceVal[hand[0].split('|')[1]])
handVal.push(faceVal[hand[1].split('|')[1]])
puts 'Total:', handTotal = handVal[0] + handVal[1]
  
def repeat(hand, handVal, faceVal, hit, deck, handTotal)
	puts "hit or stay"
	hitStay = gets.strip
	system("clear")
	if hitStay == 'h'
		hand.push(deck[rand(52)])
		handVal.push(faceVal[hand[hit+=1].split('|')[1]])
		puts hand
		puts 'Total: ', handTotal += handVal[hit]
	end
	if hitStay == 's'
		if handTotal < 21
			puts "You win"
			exit
		end
	end
	if handTotal == 21
		puts "You win"
		exit
	end
	if handTotal > 21
		puts "You lose"
		exit
	end
	repeat(hand, handVal, faceVal, hit, deck, handTotal)
end
repeat(hand, handVal, faceVal, hit, deck, handTotal)
