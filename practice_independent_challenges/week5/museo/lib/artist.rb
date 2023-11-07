class Artist
  attr_reader :id,
              :name,
              :born,
              :died,
              :country,
              :age_of_death
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @born = attributes[:born]
    @died = attributes[:died]
    @country = attributes[:country]
  end

  def age_of_death
    @died.to_i - @born.to_i
  end
end