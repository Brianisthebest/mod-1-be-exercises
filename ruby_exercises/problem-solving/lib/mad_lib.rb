class MadLib
  attr_reader :noun, :verb, :adjective, :adverb
  def initialize
    @noun = nil
    @verb = nil
    @adjective = nil
    @adverb = nil
  end

  def noun(noun)
    @noun = noun
  end

  def verb(verb)
    @verb = verb
  end

  def adjective(adjective)
    @adjective = adjective
  end

  def adverb(adverb)
    @adverb = adverb
  end

  def result
    "Do you #{@verb} your #{@adjective} #{@noun} #{@adverb}? That's hilarious!"
  end
end