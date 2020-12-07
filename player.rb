class Player

  attr_accessor :hand, :score
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = []
    @score = 0
  end
end
