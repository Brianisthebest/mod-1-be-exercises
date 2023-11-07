class Baby
  def initialize
    @sleepy = true
  end

  def tired?
    @sleepy
  end

  def nap
    @sleepy = false
  end
end