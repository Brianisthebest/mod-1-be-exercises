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
      expect(@alexander).to be_a(Contestant)
      expect(@benjamin).to be_a(Contestant)
      expect(@frederick).to be_a(Contestant)
      expect(@winston).to be_a(Contestant)
    end

    it 'has a first name' do
      expect(@alexander.first_name).to eq('Alexander')
      expect(@benjamin.first_name).to eq('Benjamin')
      expect(@frederick.first_name).to eq('Frederick')
      expect(@winston.first_name).to eq('Winston')
    end

    it 'has a last name' do
      expect(@alexander.last_name).to eq('Aigiades')
      expect(@benjamin.last_name).to eq('Franklin')
      expect(@frederick.last_name).to eq('Douglass')
      expect(@winston.last_name).to eq('Churchill')
    end

    it 'has an age' do
      expect(@alexander.age).to eq(28)
      expect(@benjamin.age).to eq(17)
      expect(@frederick.age).to eq(55)
      expect(@winston.age).to eq(18)
    end
  end

  describe '#add_game_interest' do
    it 'can add a game interest' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      expect(@alexander.game_interest).to eq(['Pick 4', 'Mega Millions'])
      expect(@frederick.game_interest).to eq(['Mega Millions'])
      expect(@winston.game_interest).to eq(['Cash 5', 'Mega Millions'])
      expect(@benjamin.game_interest).to eq(['Mega Millions'])
    end
  end
end