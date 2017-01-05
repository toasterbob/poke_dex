require_relative 'deck'
require_relative 'card'

class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    @cards = Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    ace_count = 0

    @cards.each do |card|
      if card.value == :ace
        points += 1
        ace_count += 1
      else
        points += card.blackjack_value
      end

    end

    ace_count.times do
      points += 10 if points + 10 < 21
    end

    points
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    return false if points == other_hand.points
    return true if points > other_hand.points
    true
  end

  def return_cards(deck)
    self.cards.each do |card|
      deck += card
    end

    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
