require 'singleton'

class Piece
  attr_reader :color, :board
  attr_accessor :pos, :pieces

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

  end

  def symbol
    nil #returns nil for NullPiece
  end

  def moves(new_row,new_col)
    #will magically tell you when a piece is in your way
    # puts self.move_diffs
    if self.color == new_position_piece.color
    end
      #don't go there
    #keep track of board, and don't move off board or into another same color piece
    #input = possible moves from the piece
    #returns =
  end

  def move_into_check?(end_pos)
    temp_board = board.dup
    temp_board.move_piece(self.pos, end_pos)
    temp_board.in_check?(self.color)
  end

  def valid_moves
  end

  def dup_with_new_board(new_board)
    self.class.new(self.color, new_board, self.pos.dup)
  end


end


