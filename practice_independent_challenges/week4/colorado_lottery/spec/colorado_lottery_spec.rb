require 'rspec'
require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'

RSpec.describe ColoradoLottery do
  before(:each) do
  @pick_4 = Game.new('Pick 4', 2)
  @mega_millions = Game.new('Mega Millions', 5, true)
  @alexander = Contestant.new({first_name: 'Alexander',
                               last_name: 'Aigiades',
                               age: 28,
                               state_of_residence: 'CO',
                               spending_money: 10})
  @benjamin = Contestant.new({first_name: 'Benjamin',
                              last_name: 'Franklin',
                              age: 17,
                              state_of_residence: 'PA',
                              spending_money: 100})
  @frederick = Contestant.new({first_name:  'Frederick',
                               last_name: 'Douglass',
                               age: 55,
                               state_of_residence: 'NY',
                               spending_money: 20})
  @winston = Contestant.new({first_name: 'Winston',
                             last_name: 'Churchill',
                             age: 18,
                             state_of_residence: 'CO',
                             spending_money: 5})
  @lottery = ColoradoLottery.new
  end
  describe '#initialize' do
    it 'exists' do
      expect(@lottery).to be_a(ColoradoLottery)
    end
  end

  describe '#interested_and_18?' do
    it 'can filter whos interested and 18' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')
      
      expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq(true)
      expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq(false)
      expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
    end
  end

  describe '#can_register?' do
    it 'checks if they live in CO or the game is national and they have interest' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      expect(@lottery.can_register?(@alexander, @pick_4)).to eq(true)
      expect(@lottery.can_register?(@alexander, @cash_5)).to eq(false)
      expect(@lottery.can_register?(@frederick, @mega_millions)).to eq(true)
      expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq(false)
      expect(@lottery.can_register?(@frederick, @cash_5)).to eq(false)
    end
  end

  describe '#register_contestant' do
    it 'can register constestants with spending money' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')
      @lottery.register_contestant(@alexander, @pick_4)
      expect(@lottery.registered_contestants).to eq({"Pick 4"=> [@alexander]})
      @lottery.register_contestant(@alexander, @mega_millions)
      expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander], "Mega Millions" => [@alexander]})
      @lottery.register_contestant(@frederick, @mega_millions)
      require 'pry'; binding.pry
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      require 'pry'; binding.pry
      expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander], "Mega Millions" => [@alexander, @frederick, @winston], "Cash 5" => [@winston]})
    end

  end
end