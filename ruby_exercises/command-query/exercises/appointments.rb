class Appointments
  def initialize
    @earliest = nil
  end

  def at(time)
    if @earliest.nil?
      @earliest = Time.now
      @earliest = time
    elsif time < @earliest
      @earliest = time
    end
  end

  def earliest
    @earliest
  end
end