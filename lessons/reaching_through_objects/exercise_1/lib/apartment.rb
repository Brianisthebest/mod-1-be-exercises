class Apartment
  attr_reader :rented, :rooms

  def initialize
    @rented = false
    @rooms = []
  end

  def is_rented? 
    @rented
  end

  def rent
    @rented = true
  end

  def add_room(new_room)
   if @rooms.length <= 4
    @rooms << new_room
   end
  end 
  
  def list_rooms_by_name_alphabetically
   sorted_rooms = []
   @rooms.each do |room|
      sorted_rooms << room.name
    end
    sorted_rooms.sort
  end
end