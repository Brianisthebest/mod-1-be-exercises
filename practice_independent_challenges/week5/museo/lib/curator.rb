class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
    @artists_and_photos = @artists_and_photos
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    artists.find { |artist| artist.id == id } 
  end

  def list_artists_and_photos
    @artists_and_photos = Hash.new
    @artists.each do |artist|
      artists_photos = @photographs.select { |photo| photo.artist_id == artist.id } 
      @artists_and_photos[artist] = artists_photos
    end
    @artists_and_photos
  end

  def find_artist_with_multiple_photos
    artist_count = Hash.new(0)
    @photographs.each { |photo| artist_count[photo.artist_id] += 1 }
    require 'pry'; binding.pry
    artist = @artists.select do |artist|
      artist_count.keys.include?(artist.id) && artist_count.va
    end
    require 'pry'; binding.pry
  end
end