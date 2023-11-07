class Werewolf
  attr_reader :name, :location
  def initialize(name, location = 'Whatevs')
    @name = name
    @location = location
    @form = 'Human'
    @hunger = false
  end

  def human?
    @form == 'Human'
  end

  def wolf?
    @form == 'Wolf'
  end

  def change!
    if @form == 'Wolf'
      @form = 'Human'
    else
      @form = 'Wolf'
      @hunger = true
    end
  end

  def hungry?
    @hunger
  end

  def consume(victim)
    if @form == 'Wolf'
      victim.status = :dead
      @hunger = false
    end
  end
end