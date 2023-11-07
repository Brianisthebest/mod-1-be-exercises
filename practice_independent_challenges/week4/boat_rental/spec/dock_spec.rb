require './lib/boat'
require './lib/renter'
require './lib/dock'

RSpec.describe Dock do
  before(:each) do
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")    
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    @dock = Dock.new("The Rowing Dock", 3)
  end

  describe "#initialize" do
    it 'exists and has attributes' do
      expect(@dock).to be_a(Dock)
      expect(@dock.name).to eq('The Rowing Dock')
      expect(@dock.max_rental_time).to eq(3)
    end
  end

  describe '#rent' do
    it 'can rent boats to renters' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      expect(@dock.rental_log).to eq({@kayak_1 => @patrick, @kayak_2 => @patrick, @sup_1 => @eugene})
      expect(@kayak_1.hours_rented).to eq(1)
    end
  end

  describe '#charge' do
    it 'displays hash with key value pairs' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      expect(@dock.charge(@kayak_1)).to eq({:card_number => "4242424242424242", :amount => 60})
      expect(@dock.charge(@sup_1)).to eq({:card_number => "1313131313131313", :amount => 15})
    end
  end

  describe '#return' do
    it 'returns a boat and removes from rental log' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@sup_1, @eugene)
      expect(@dock.return(@kayak_1)).to eq({@sup_1 => @eugene})
    end
  end

  describe '#log_hour' do
    it 'increases all boat rented by an hour' do  \
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@sup_1, @eugene)
      expect(@kayak_1.hours_rented).to eq(1)
      expect(@sup_1.hours_rented).to eq(1)
      @dock.log_hour
      @dock.log_hour
      @dock.log_hour
      expect(@kayak_1.hours_rented).to eq(3)
      expect(@sup_1.hours_rented).to eq(3)
    end
  end

  describe '#revenue' do
    it 'it returns the totale revenue' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@sup_1, @eugene)
      @dock.log_hour
      @dock.log_hour
      @dock.return(@kayak_1)
      @dock.return(@sup_1)
      # take no arguements
      # returns total revenue by charging all boats
      # that have been rented and returned
      expect(@dock.revenue).to eq(105)
    end
  end
end
