require 'rspec'
require './lib/photograph'
require './lib/artist'

RSpec.describe Photograph do
  before(:each) do
    @photo_attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }   
    @photograph = Photograph.new(@photo_attributes)
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@photograph).to be_a(Photograph)
      expect(@photograph.id).to eq('1')
      expect(@photograph.name).to eq('Rue Mouffetard, Paris (Boy with Bottles)')
      expect(@photograph.artist_id).to eq('4')
      expect(@photograph.year).to eq('1954')
    end
  end
end