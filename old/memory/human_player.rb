

class HumanPlayer
  attr_reader :row, :col
  attr_writer :known_cards

  def initialize
    @row = nil
    @col = nil
    @known_cards = {}
  end

  def get_guess
    puts "What row?"
    @row = gets.chomp.to_i
    puts "What column?"
    @col = gets.chomp.to_i
    [@row, @col]
  end

  def receive_revealed_card(pos, card)
  end
end
