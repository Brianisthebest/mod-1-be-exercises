class Apple
  def initialize
    @weeks_old = 0
    @riped = false
  end

  def ripe?
    @riped
  end

  def wait_a_week
    @weeks_old += 1
    if @weeks_old >= 3
      @riped = true
    end
  end
end