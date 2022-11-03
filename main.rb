require_relative './lib/game_board.rb'

board = GameBoard.new([4, 5], [3, 2])

board.create_nodes
#board.print_graph
board.create_tree
