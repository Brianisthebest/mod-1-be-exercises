class Medusa
  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(person)
    if @statues.count < 3
      @statues.push(person)
      person.stone = true
    else
      @statues.first.stone = false
      @statues.delete_at(0)
      @statues.push(person)
    end
  end
end

class Person
  attr_reader :name
  attr_accessor :stone
  def initialize(name)
    @name = name
    @stone = false
  end

  def stoned?
    @stone
  end
end