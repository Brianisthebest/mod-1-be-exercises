require './lib/employee'
class Ceo < Employee
  attr_reader :base_salary,
              :bonus

  def initialize(base_salary, bonus, name, id)
    super(name, id)
    @base_salary = base_salary
    @bonus       = bonus
  end


end