require 'rspec'
require './lib/photograph'
require './lib/artist'

RSpec.describe Artist do
  before(:each) do
    @photo_attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }   
    @photograph = Photograph.new(@photo_attributes)
    
    @artist_attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    @artist = Artist.new(@artist_attributes)
  end
  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@artist).to be_a(Artist)
      expect(@artist.id).to eq('2')
      expect(@artist.name).to eq('Ansel Adams')
      expect(@artist.born).to eq('1902')
      expect(@artist.died).to eq('1984')
      expect(@artist.country).to eq('United States')
      expect(@artist.age_of_death).to eq(82)
    end
  end
end
