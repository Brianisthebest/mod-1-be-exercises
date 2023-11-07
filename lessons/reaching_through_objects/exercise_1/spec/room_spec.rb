require 'rspec'
require './lib/room'

RSpec.describe Room do
  describe '#initialize' do
    it 'exists' do
      bathroom = Room.new('bathroom')

      expect(bathroom).to be_a(Room)
    end

    it 'has a name' do
      bathroom = Room.new('bathroom')

      expect(bathroom.name).to eq('bathroom')
    end
  end
end