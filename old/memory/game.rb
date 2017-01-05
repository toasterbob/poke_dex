require_relative 'board'
require_relative 'card'
require_relative 'human_player'
require_relative 'computer_player'

require 'byebug'

class Game
  attr_reader :board, :player

  def initialize
    @board = Board.new
    @board.populate
    @previous_card = nil
    @player = HumanPlayer.new
  end

  def play
    until @board.game_over?
      @board.render
      position = @player.get_guess
      card = @board[position]
      @player.receive_revealed_card(position, card)
      make_guess?(card)
    end
  end

  def make_guess?(card)
    if @previous_card
      if @previous_card.value == card.value
        @previous_card.visible_side = "up"
        card.visible_side = "up"
        @board.render
        @previous_card = nil
      else
        card.visible_side = "up"
        @board.render
        @previous_card.visible_side = "down"
        card.visible_side = "down"
        @previous_card = nil
      end
    else
      card.visible_side = "up"
      @previous_card = card
    end
  end

  # def view_board
  #   grid.each do |row|
  #     row.each do |pos|
  #       pos.visible_side = "up"
  #     end
  #   end
  #   @board.render
  # end
end

game = Game.new
game.play
