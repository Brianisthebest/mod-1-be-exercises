class Bag
  attr_reader :candies
  def initialize
    @candies = []
  end

  def empty?
    candies.empty?
  end

  def count
    candies.count
  end

  def <<(candy)
    candies << candy
  end

  def contains?(type)
    # require 'pry'; binding.pry
    !candies.include?(type)
  end
end