require './lib/boat'
require './lib/renter'

RSpec.describe Boat do
  before(:each) do
    @kayak = Boat.new(:kayak, 20)
  end

  describe "#initialize" do
    it 'exists and has attributes' do
      expect(@kayak).to be_a(Boat)
      expect(@kayak.type).to eq(:kayak)
      expect(@kayak.price_per_hour).to eq(20)
      expect(@kayak.hours_rented).to eq(0)
    end
  end
  describe "#add_hour" do
    it 'can add hours rented' do
      @kayak.add_hour
      @kayak.add_hour
      @kayak.add_hour
      expect(@kayak.hours_rented).to eq(3)
    end
  end
end