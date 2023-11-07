class Contestant
  attr_reader :first_name,
              :last_name, :age,
              :state_of_residence,
              :spending_money,
              :game_interest

  def initialize(contestant_details)
    @first_name = contestant_details[:first_name]
    @last_name = contestant_details[:last_name]
    @age = contestant_details[:age]
    @state_of_residence = contestant_details[:state_of_residence]
    @spending_money = contestant_details[:spending_money]
    @game_interest = []
  end

  def add_game_interest(game)
    @game_interest << game
  end
end