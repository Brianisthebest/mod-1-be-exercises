class Ogre
  attr_reader :name, :home, :ogre_encounter_counter, :swings
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @ogre_encounter_counter = 0
    @swings = 0
  end

  def encounter(human)
    @ogre_encounter_counter += 1
    human.increase_encounter
    if human.notices_ogre?
      swing_at(human)
    end
  end

  def swing_at(human)
    @swings += 1
  end

  def apologize(human)
    @swings = 0
    @encounter_counter = 0
    human.revive
  end

end

class Human
  attr_reader :name, :encounter_counter

  def initialize(name = "Jane")
    @name = name
    @encounter_counter = 0
  end

  def increase_encounter
    @encounter_counter += 1
  end

  def notices_ogre?
    return true if @encounter_counter % 3 == 0
    false
  end

  def knocked_out?
    return true if encounter_counter % 2 == 0
    false
  end

  def revive
    @encounter_counter = -1
  end

end