require 'rspec'
require './lib/building'
require './lib/apartment'

RSpec.describe Street do
  before(:each) do
    @adlington = Street.new
    @zebra = Building.new("123", "Zebra Apartments")
    @savills = Building.new("623", "Savills Apartment Building")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@adlington).to be_a(Street)
    end
  end

  describe '@add_building' do
    it 'can add building' do
      @adlington.add_building(@zebra)
      @adlington.add_building(@savills)

      expect(@adlington).to eq()
    end
  end
end