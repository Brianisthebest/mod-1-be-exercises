class Wizard
  attr_reader :name, :bearded, :rested
  def initialize(name, bearded = false)
    @name = name
    @bearded = bearded
    @spells_cast = 0
  end

  def bearded?
    name == "Ben" 
  end

  def rested?
    @spells_cast < 3
  end

  def incantation(spell)
    "sudo #{spell}"
  end

  def cast
    @spells_cast += 1
    "MAGIC MISSILE!"
  end
end