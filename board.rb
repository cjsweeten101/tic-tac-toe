# frozen_string_literal: true

# Responsible for storing board state and placing pieces
class Board
  def initialize
    @board_state = Array.new(3, ' ') { Array.new(3, ' ') }
  end

  def puts_board
    @board_state.each do |row|
      puts "#{row[0]}|#{row[1]}|#{row[2]}"
    end
  end

  def place(loc, piece)
    @board_state[loc[1]][loc[0]] = piece
  end
end
