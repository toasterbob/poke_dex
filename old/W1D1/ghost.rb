
word_arr = File.readlines("dictionary.txt")
values = word_arr.map(&:chomp)
keys = values.map(&:to_sym)
DICTIONARY = keys.zip(values).to_h
LOSSES = {
  1 => "G",
  2 => "GH",
  3 => "GHO",
  4 => "GHOS",
  5 => "GHOST"
}


class Game
  attr_accessor :fragment, :dictionary, :current_player, :previous_player, :losses

  def initialize(*players)
    # @players = players
    @current_player = players[0]
    @previous_player = players[1]
    @fragment = ""
    @dictionary = DICTIONARY
    @losses = Hash.new(0)
    players.each { |player| @losses[player] = 0 }
  end

  def play_round
    p "The fragment is #{fragment}."
    p "Current player is #{@current_player.name}"
    letter = current_player.guess
    fragment << letter
    until valid_play?(fragment) do
      puts "invalid guess"
      fragment.chop!
      letter = current_player.guess
      fragment << letter
    end

    if DICTIONARY.values.include?(fragment.downcase)
      p "You guessed a word, #{fragment}. Game over."
      losses[current_player] += 1
      p "#{current_player.name}'s score is #{record(current_player)}"
      p "#{previous_player.name}'s score is #{record(previous_player)}"
      @fragment = ""
    end

    next_player!
  end

  def play_game
    p "The game commences!"
    until losses.values.any? {|losses| losses == 5}
      self.play_round
    end
    p "Game over!"
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def valid_play?(string)
    DICTIONARY.values.any? do |value|
      value.start_with?(string.downcase)
    end
  end

  def record(player)
    no_of_losses = losses[player]
    LOSSES[no_of_losses]
  end

  def run
    until losses.values.include?(5)
      play_round
    end
  end

end

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "Please say a letter."
    letter = gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid guess."
    self.guess
  end
end

yamini = Player.new("Yamini")
matt = Player.new("Matt")
#
game = Game.new(yamini, matt)
game.play_game
