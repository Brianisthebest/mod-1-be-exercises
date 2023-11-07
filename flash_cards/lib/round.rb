class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn  
    @deck.cards.delete(current_card)
    current_turn
  end

  def number_correct?
    @current_turns = 0
    @turns.each do |turn|
      if turn.correct? == true
        @correct_turns += 1
      end
    end
    @correct_turns
  end

  def number_correct_by_category(category)
    cat_count = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        cat_count += 1
      end
    end
    cat_count
  end

  def percent_correct
    (@correct_turns.to_f / @turns.size.to_f) * 100
  end

  def percent_correct_by_category(category)
    cat_cards = []
    turns.each do |turn|
      if turn.card.category == category && turn.correct?
        cat_cards << turn
      end
    end
    (@correct_turns.to_f / cat_cards.size.to_f) * 100
  end
end
