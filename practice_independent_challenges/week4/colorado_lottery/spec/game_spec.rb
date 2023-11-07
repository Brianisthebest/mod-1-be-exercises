require 'rspec'
require './lib/contestant'
require './lib/game'

RSpec.describe Game do
  before(:each) do
  @pick_4 = Game.new('Pick 4', 2)
  @mega_millions = Game.new('Mega Millions', 5, true)
  @lottery = Game.new('Lottery', 4)
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
  end

  describe '#initialize' do
    it 'exists' do
      expect(@mega_millions).to be_a(Game)
    end

    it 'has a name' do
      expect(@mega_millions.name).to eq('Mega Millions')
    end

    it 'has a cost' do
      expect(@mega_millions.cost).to eq(5)
    end

    it 'has a national_drawing?' do
      expect(@mega_millions.national_drawing?).to eq(true)
      expect(@pick_4.national_drawing?).to eq(false)
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
end