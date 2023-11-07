class Adult
  def initialize
    @sober = true
    @drink_count = 0
  end

  def sober?
    @sober
  end

  def consume_an_alcoholic_beverage
    if @drink_count >= 2
      @sober = false
    end
    @drink_count += 1
  end
end