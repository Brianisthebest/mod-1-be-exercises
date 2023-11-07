class Direwolf
  attr_reader :name, :home, :size, :starks_to_protect

  def initialize(name, home = 'Beyond the Wall', size = 'Massive')
    @name = name
    @home = home
    @size = size
    @starks_to_protect = []
  end

  def protects(person)
    if home == person.location && @starks_to_protect.count < 2
      @starks_to_protect << person
      person.safety = true
    end
  end

  def hunts_white_walkers?
    if @starks_to_protect.count > 0
      false
    else
      true
    end
  end

  def leaves(person)
    @starks_to_protect.delete(person)
    person.safety = false
    person
  end
end

class Stark
  attr_reader :name, :location, :house_words
  attr_accessor :safety

  def initialize(name, location = 'Winterfell', house_words = 'Winter is Coming')
    @name = name
    @location = location
    @house_words = house_words
    @safety = false
  end

  def safe?
    @safety
  end
end