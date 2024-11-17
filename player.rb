# frozen_string_literal: true

# For defining who is Xs and Os
class Player
  attr_accessor :piece

  def initialize(player_number)
    raise ArgumentError, 'Player must be 1 or 2' unless [1, 2].include?(player_number)

    @piece = player_number == 1 ? 'X' : 'O'
  end

  def to_s
    @piece == 'X' ? 'Player 1' : 'Player 2'
  end
end
