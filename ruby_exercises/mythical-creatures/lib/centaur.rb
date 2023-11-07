class Centaur
  attr_reader :name, :breed, :standing, :laying

  def initialize(name, breed)
    @name = name
    @breed = breed
    @action_count = 0
    @standing = true
    @laying = false
  end

  def shoot
    @action_count += 1
    if @action_count > 2 || laying?
      "NO!"
    else
      "Twang!!!"
    end
  end

  def run
    @action_count += 1
    if !laying?
      "Clop clop clop clop!"
    else
      'NO!'
    end
  end

  def cranky?
    @action_count > 2
  end

  def standing?
    @standing
  end

  def sleep
    if !laying?
      "NO!"
    else
      @action_count = 0
    end
  end

  def lay_down
    @standing = false
    @laying = true
  end

  def laying?
    return true if @laying == true
  end

  def stand_up
    @laying = false
    @standing = true
  end

  def drink_potion
    if laying?
      'NO!'
    elsif @action_count == 0
      "I'M GOING TO THROW UP"
    else
      @action_count = 0
    end
  end
end