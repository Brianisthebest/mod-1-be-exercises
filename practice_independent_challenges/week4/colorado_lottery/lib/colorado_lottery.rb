class ColoradoLottery
attr_reader :registered_contestants

  def initialize  
    @registered_contestants = Hash.new
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

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      contestant.game_interest.each do |game|
        @registered_contestants[game] = [contestant]
      end
    else
      false
    end
  end
end