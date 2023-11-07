class Lovisa
  attr_reader :title, :characteristics

  def initialize(title, characteristics = ['brilliant'])
    @title = title
    @characteristics = characteristics
  end

  def brilliant?
    true
  end

  def kind?
    @characteristics.include?('kind')
  end

  def say(words)
    "**;* #{words} **;*"
  end
end