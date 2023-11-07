class Photograph
  attr_reader :id,
              :name,
              :artist_id,
              :year

  def initialize(photo_attributes)
    @id = photo_attributes[:id]
    @name = photo_attributes[:name]
    @artist_id = photo_attributes[:artist_id]
    @year = photo_attributes[:year]
  end
end