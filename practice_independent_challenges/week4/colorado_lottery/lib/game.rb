class Game
  attr_reader :name, :cost, :national_drawing
  def initialize(name, cost, national_drawing = false)
    @name = name
    @cost = cost
    @national_drawing = national_drawing
  end

  def national_drawing?
    @national_drawing
  end

  def interested_and_18?(contestant, game)
    if contestant.age >= 18
      contestant.game_interest.include?(game&.name)
    else
      false
    end
  end

  def can_register?(contestant, game)
      # require 'pry'; binding.pry
    if interested_and_18?(contestant, game) && contestant.state_of_residence == 'CO'
      true
    elsif interested_and_18?(contestant, game) && game&.national_drawing?
      true
    else
      false
    end
  end
end

# A contestant #can_register? if they are interested in the game,
# 18 years of age or older, 
# and they are either a Colorado resident or this is a national game