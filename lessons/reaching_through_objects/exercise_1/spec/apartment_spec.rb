require 'rspec'
require './lib/apartment'
require './lib/room'

RSpec.describe Apartment do
  before(:each) do
    @apartment = Apartment.new
    @bathroom = Room.new('bathroom')
    @laundry = Room.new('laundry')
    @kitchen = Room.new('kitchen')
    @bedroom = Room.new('bedroom')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@apartment).to be_a(Apartment)
      expect(@apartment.is_rented?).to eq(false)
    end
  end

  describe '#rent' do
    it 'can change rent status to true' do
      @apartment.rent

      expect(@apartment.is_rented?).to eq(true)
    end
  end

  describe '#add_room' do
    it 'can add rooms to the apartment' do
      @apartment.add_room(@bathroom)
      @apartment.add_room(@laundry)
      @apartment.add_room(@kitchen)
      @apartment.add_room(@bedroom)

      expect(@apartment.rooms).to eq([@bathroom, @laundry, @kitchen, @bedroom])
    end

    xit 'only allows four rooms to be stored' do
      @apartment.add_room(@bathroom)
      @apartment.add_room(@laundry)
      @apartment.add_room(@kitchen)
      @apartment.add_room(@bedroom)

      expect(@apartment.add_room(@dining_room = Room.new('dining_room'))).to eq([@bathroom, @laundry, @kitchen, @bedroom])
    end

    it 'can alphabetize the rooms' do
      @apartment.add_room(@bathroom)
      @apartment.add_room(@laundry)
      @apartment.add_room(@kitchen)
      @apartment.add_room(@bedroom)

      expect(@apartment.list_rooms_by_name_alphabetically).to eq(["bathroom", "bedroom", "kitchen", "laundry"])
    end
  end
end