# ./camry.rb
require './lib/engine'
require './lib/airconditionable'

class Camry
include Engine, AirConditionable

  def drive
    "Back wheels go!"
  end
end
