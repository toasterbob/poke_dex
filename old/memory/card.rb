class Card
  attr_reader :value
  attr_accessor :visible_side

  def initialize(value)
    @value = value
    @visible_side = "down"
  end

  def hide
    @visible_side = "down"
  end

  def reveal
    @visible_side = "up"
  end

end
