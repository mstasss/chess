require 'singleton'

class Piece
  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize(color, board, pos)
    @color = color    
    @board = board 
    @pos = pos

  end

  def symbol 
    nil #returns nil for NullPiece
  end

  def moves 
    puts self.move_diffs
    #keep track of board, and don't move off board or into another same color piece
    #input = possible moves from the piece
    #returns =
  end


end


