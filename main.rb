# frozen_string_literal: true

require_relative 'board'
require_relative 'interface'
require_relative 'player'

game_over = false

player1 = Player.new(1)
player2 = Player.new(2)
board = Board.new
current_player = player1
board.puts_board

until game_over
  puts "Its #{current_player}'s turn"
  input = Interface.get_input
  board.place(input, current_player.piece)
  board.puts_board
  current_player = current_player == player1 ? player2 : player1
end
