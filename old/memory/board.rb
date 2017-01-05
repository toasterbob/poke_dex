require_relative 'card'
require 'byebug'

class Board

  def initialize
    @grid = Array.new(4) { Array.new(5) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def populate
    current_cards = card_list
    @grid.each_with_index do |row, j|
      row.each_index do |i|
        @grid[j][i] = current_cards.pop
      end
    end
  end

  def card_list
    number_array = (0..9).to_a
    number_array = (number_array + number_array).shuffle

    card_list = []
    number_array.each do |number|
      card_list << Card.new(number)
    end
    card_list
  end

  def render
    @grid.each do |row|
      row.each do |pos|
        if pos.visible_side == "down"
          print " X "
        else
          print " #{pos.value} "
        end
      end
      print " \n"
    end
    print "\n"
  end

  def game_over?
    test = true
    @grid.each do |row|
      row.each do |pos|
        test = false if pos.visible_side == "down"
      end
    end
    test
  end
end
