require 'rspec'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

RSpec.describe Artist do
  before(:each) do
    @curator = Curator.new
    @photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    })
    @photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    })
    @photo_3 = Photograph.new({
      id: "3",      
      name: "Big Blue",
      artist_id: "2",
      year: "1947"
    })
    @artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
     })        
     @artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
      })
  end

  describe "#initialize" do
    it 'exists and has attributes' do
      expect(@curator).to be_a(Curator)
      expect(@curator.photographs).to eq([])
      expect(@curator.artists).to eq([])
    end
  end
  
  describe '#add_photo' do
    it 'can add photos to array' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)

      expect(@curator.photographs).to be_a(Array)
      expect(@curator.photographs).to eq([@photo_1, @photo_2])
    end
  end

  describe '#add_artist' do
    it 'can add artists to array' do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.artists).to be_a(Array)
      expect(@curator.artists).to eq([@artist_1, @artist_2])
    end
  end

  describe '#find_artist_by_id' do
    it 'can find artists by id' do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.find_artist_by_id('1')).to eq(@artist_1)
      expect(@curator.find_artist_by_id('2')).to eq(@artist_2)
    end
  end

  describe '#list_artists_and_photos' do
    it 'can list all artists and their photos' do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)

      expect(@curator.list_artists_and_photos).to eq({@artist_1 => [@photo_1], @artist_2 => [@photo_2, @photo_3]})
    end
  end

  describe '#find_artist_with_multiple_photos' do
    it 'will find artists with more than one photograph' do
      # iterate over artists
      # then iterate over photos
      # make sure artist ids match on both
      # give an array of artists names that meet criteria
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      
      expect(@curator.find_artist_with_multiple_photos).to eq(['Ansel Adams'])
    end
  end
end
