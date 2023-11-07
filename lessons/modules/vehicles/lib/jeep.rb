# ./jeep.rb
require './lib/engine'
require './lib/airconditionable'

class Jeep
include Engine, AirConditionable

  def drive
    "All wheels go!"
  end
end
