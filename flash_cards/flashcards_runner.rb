require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
card_5 = Card.new("What is the capital of California?", "Sacramento", :Geography)
card_6 = Card.new("Who wrote the song 'Purple Haze'?", "Jimi Hendrix", :Pop_Culture)
deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

round = Round.new(deck)

def game(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  total_turns = round.deck.count
  until round.deck.count == 0
    puts "-------------------------------------------------"
    puts "This is card number #{round.turns.size + 1} out of #{total_turns}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp
    round.take_turn(guess)
    puts round.turns.last.feedback
  end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct?} correct guesses out of #{total_turns} for a total score of #{round.percent_correct.round}%."
  puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
  puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
  puts "Pop Culture - #{round.percent_correct_by_category(:Pop_Culture)}% correct"
end

game(round)