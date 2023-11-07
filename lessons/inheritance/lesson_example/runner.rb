require './lib/ceo'
require './lib/manager'
require './lib/intern'

ali = Ceo.new(15, 20)
ben = Manager.new(10, 'Jeff', 3456)
chris = Intern.new(5, 'Chris', 7)

require "pry"; binding.pry

# Ali, Ben, and Chris all need names and IDs in the system. Where can they get those?