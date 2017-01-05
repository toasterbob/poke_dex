class ComputerPlayer
  attr_reader :row, :col
  attr_accessor :known_cards

  def initialize
    @row = nil
    @col = nil
    @known_cards = {}
  end

  def get_guess
    if @known_cards.empty?
      @row = rand(4)
      @col = rand(5)
    end
      # known_match = []
      # @known_cards.each_pair do |position, value|
      #   @known_cards.each_pair do |position2, value2|
      #     if value == value2 && position != position2
      #       # known_match << position, position2
      #     end
      #   end
      # end
  end

  def receive_revealed_card(pos, card)
    known_cards[pos] = card
  end
end
