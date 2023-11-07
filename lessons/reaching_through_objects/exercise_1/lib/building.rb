class Building
  attr_reader :building_number,
              :building_name,
              :apartments

  def initialize(building_number, building_name)
    @building_name = building_name
    @building_number = building_number
    @apartments = []
  end

  def add_apartment(apt_num)
    @apartments << apt_num
  end

  def list_apartments
    @apartments
  end
end