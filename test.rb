require_relative 'board'
require_relative './pieces/bishop.rb'
require_relative './pieces/king.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/nullpiece.rb'
require_relative './pieces/pawn.rb'
require_relative './pieces/piece.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/rook.rb'
require_relative './pieces/slideable.rb'
require_relative './pieces/steppable.rb'


# TESTS
# testing = Board.new
# testing.move_piece([1, 3], [2, 3])
# testing.move_piece([1, 4], [2, 4])

# testing.move_piece([0, 3], [1, 3])
# testing.move_piece([7,4], [2,2])
# p testing.in_check?(:white)
# testing.board_printer

#move_into_check? test ----
# board = Board.new
# black_king = King.new(:black, board, [0, 4])
# white_rook = Rook.new(:white, board, [1, 4])
# black_queen = Queen.new(:black, board, [2, 4])
# board[0, 4] = black_king
# board[1, 4] = white_rook
# board[2, 4] = black_queen

# board.board_printer
# move_from = [1, 4]
# move_to = [3, 4]

# puts "Testing if moving the rook puts the king in check..."
# if white_rook.move_into_check?(move_to)
#   puts "Test Passed: Moving the rook puts the king in check."
# else
#   puts "Test Failed: Moving the rook should put the king in check, but it didn't."
# end

#testing Piece#moves and pawn moves

# Initialize a board
board = Board.new

# Place pawns on the board
white_pawn = Pawn.new(:white, board, [1, 1])
black_pawn = Pawn.new(:black, board, [6, 1])
board[1, 1] = white_pawn
board[6, 1] = black_pawn

# Place a piece to test capture and block
board[2, 2] = Pawn.new(:black, board, [2, 2]) # Black pawn for white to capture
board[5, 1] = Pawn.new(:white, board, [5, 1]) # White pawn to block black

# Test forward movement
puts "Testing white pawn forward movement..."
if white_pawn.moves.include?([2, 1])
  puts "Pass: White pawn can move forward one square."
else
  puts "Fail: White pawn should be able to move forward one square."
end

# Test two-step initial move
puts "Testing white pawn two-step initial move..."
if white_pawn.moves.include?([3, 1])
  puts "Pass: White pawn can move forward two squares from the starting position."
else
  puts "Fail: White pawn should be able to move forward two squares from the starting position."
end

# Test diagonal capture
puts "Testing white pawn diagonal capture..."
if white_pawn.moves.include?([2, 2])
  puts "Pass: White pawn can capture diagonally."
else
  puts "Fail: White pawn should be able to capture diagonally."
end

# Test movement block
puts "Testing black pawn blocked movement..."
if black_pawn.moves.include?([5, 1])
  puts "Fail: Black pawn should not be able to move forward as it's blocked."
else
  puts "Pass: Black pawn cannot move forward as it's blocked."
end

#test of a change!

# CHESSBOARD IN POSITIONS
# [0,0] [0,1] [0,2] [0,3] [0,4] [0,5] [0,6] [0,7]
# [1,0] [1,1] [1,2] [1,3] [1,4] [1,5] [1,6] [1,7]
# [2,0] [2,1] [2,2] [2,3] [2,4] [2,5] [2,6] [2,7]
# [3,0] [3,1] [3,2] [3,3] [3,4] [3,5] [3,6] [3,7]
# [4,0] [4,1] [4,2] [4,3] [4,4] [4,5] [4,6] [4,7]
# [5,0] [5,1] [5,2] [5,3] [5,4] [5,5] [5,6] [5,7]
# [6,0] [6,1] [6,2] [6,3] [6,4] [6,5] [6,6] [6,7]
# [7,0] [7,1] [7,2] [7,3] [7,4] [7,5] [7,6] [7,7]
