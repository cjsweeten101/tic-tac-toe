# frozen_string_literal: true

# Board state, checking for game over
class Board
  def initialize
    @board_state = Array.new(3, ' ') { Array.new(3, ' ') }
  end

  def puts_board
    @board_state.each_with_index do |row, index|
      puts "#{row[0]}|#{row[1]}|#{row[2]}"
      puts '-----' if index < @board_state.length - 1
    end
  end

  def place(loc, piece)
    raise 'Invalid placement' if @board_state[loc[1]][loc[0]] != ' '

    @last_placed_piece = piece
    @board_state[loc[1]][loc[0]] = piece
  end

  def game_over?
    horizontals? || verticals? || diagonals?
  end

  def no_moves?
    @board_state.flatten.none?(' ')
  end

  def horizontals?
    @board_state.each do |row|
      result = row.select { |piece| piece == @last_placed_piece }

      return true if result.size == 3
    end
    false
  end

  def verticals?
    column_array = build_vertical_array(@board_state)
    column_array.each do |column|
      result = column.select { |piece| piece == @last_placed_piece }

      return true if result.size == 3
    end
    false
  end

  def build_vertical_array(horizontal_array)
    result = [[], [], []]
    horizontal_array.each do |row|
      row.each_with_index do |piece, index|
        result[index].push(piece)
      end
    end
    result
  end

  def diagonals?
    diagonals = build_diagonal_arrays(@board_state)
    diagonals.each do |diagonal|
      result = diagonal.select { |piece| piece == @last_placed_piece }

      return true if result.size == 3
    end
    false
  end

  def build_diagonal_arrays(horizontal_array)
    result = [[], []]
    horizontal_array.flatten.each_with_index do |piece, index|
      if index.even?
        if index < 4
          result[0].push(piece)
        elsif index > 4
          result[1].push(piece)
        elsif index == 4
          result[0].push(piece)
          result[1].push(piece)
        end
      end
    end
    result[0][0], result[1][1] = result[1][1], result[0][0]
    result
  end
end
