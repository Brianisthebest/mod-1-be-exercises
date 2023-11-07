require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  describe '#takes_turns' do
    it 'can take turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end

    describe '#current_card' do
      it 'will track the current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck) 

        expect(round.current_card).to be(card_1)
      end
    end

    describe '#take_turn' do
      it 'will move on the the next move' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        expect(new_turn.class).to be(Turn)
        expect(round.turns).to eq([new_turn])
        expect(round.current_card).to eq(card_2)
      end

      it 'will evaulate the answer' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        round.take_turn("Juneau")

        expect(round.number_correct?).to be(1)
        expect(round.current_card).to eq(card_2)

        round.take_turn("Venus")

        expect(round.turns.count).to eq(2)
        expect(round.turns.last.feedback).to eq("Incorrect")
      end

      it 'will take multiple turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        round.take_turn("Juneau")
        round.take_turn("Venus")

        expect(round.turns.count).to eq(2)
        expect(round.turns.last.feedback).to eq("Incorrect")
        expect(round.number_correct?).to eq(1)

        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(0)
        expect(round.percent_correct).to eq(50.0)
        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(round.current_card).to eq(card_3)
      end
    end
  end
end
