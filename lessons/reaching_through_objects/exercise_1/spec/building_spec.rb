require 'rspec'
require './lib/building'
require './lib/apartment'

RSpec.describe Building do
  before(:each) do
    @bldg = Building.new("623", "Savills Apartment Building")
    @apt_1 = Apartment.new
    @apt_2 = Apartment.new
    @apt_5 = Apartment.new
  end
  describe '#initialize' do
    it 'exists' do
      expect(@bldg).to be_a(Building)
      expect(@bldg.building_number).to eq('623')
      expect(@bldg.building_name).to eq('Savills Apartment Building')
    end
  end

  describe '#add_apartment' do
    it 'can add apartments to the building' do
      @bldg.add_apartment(@apt_1)
      @bldg.add_apartment(@apt_2)
      @bldg.add_apartment(@apt_5)

      expect(@bldg.list_apartments).to eq([@apt_1, @apt_2, @apt_5])
      expect(@bldg.apartments.first).to be_a(Apartment)
    end
  end
end