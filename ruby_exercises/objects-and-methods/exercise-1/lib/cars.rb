class MyCar
attr_accessor :color
attr_reader :yellow
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def gas_milage(gallons, miles)
    puts "Your gas milage is #{miles / gallons} gallons per mile."
  end

  def to_s
    "My car is a #{@year} #{@model}."
  end
end

toyota = MyCar.new(2001, "Toyota", "Silver")

toyota.speed_up(30)
toyota.current_speed
toyota.brake(30)
toyota.shut_down
toyota.gas_milage(15, 300)

puts toyota