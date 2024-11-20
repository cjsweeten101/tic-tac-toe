# frozen_string_literal: true

require_relative 'board'
require_relative 'interface'
require_relative 'player'

game_over = false

player1 = Player.new(1)
player2 = Player.new(2)
board = Board.new
current_player = player2
board.puts_board

until game_over
  current_player = current_player == player1 ? player2 : player1
  puts "Its #{current_player}'s turn"
  begin
    input = Interface.get_input
    board.place(input, current_player.piece)
  rescue StandardError
    puts 'Invalid move'
    retry
  end
  board.puts_board
  game_over = true if board.game_over? || board.no_moves?
end

if board.no_moves?
  puts 'Game over! Tie!'
else
  puts "Game over! #{current_player} won!"
end

board.puts_board
