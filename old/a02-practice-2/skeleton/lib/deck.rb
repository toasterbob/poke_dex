require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    @cards = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        @cards << Card.new(suit, value)
      end
    end

    @cards
  end

  attr_reader :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > cards.count
    @cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each do |card|
      self.cards << card
    end
  end
end
