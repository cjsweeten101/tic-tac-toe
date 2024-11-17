# frozen_string_literal: true

# Responsible for storing board state and placing pieces
class Board
  @board_state = Array.new(3) { Array.new(3) }
  def board_state
    # return formatted board state
    # Should look like:
    #    1 2 3
    #  1 X| |X
    #  2 X|O|
    #  3 O| |
    #  etc...
  end

  def make_move(loc, piece)
    board_state[loc[0]][loc[1]] = piece
  end
end
