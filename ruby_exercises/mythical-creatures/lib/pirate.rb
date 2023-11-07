class Pirate
  # attr_reader :name
  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @heinous_act_counter = 0
    @booty = 0
  end

  def name
    @name
  end

  def job
    @job
  end

  def booty
    @booty
  end

  def cursed?
    @heinous_act_counter >= 3
  end

  def commit_heinous_act
    @heinous_act_counter += 1
  end

  def rob_ship
    @booty += 100
  end
end