require_relative 'piece.rb'
require_relative 'slideable.rb'

class Queen < Piece
  include Slideable
  def move_dirs
    #returns both horizontally and vertically
  end

  def to_s
    if color == :white
      return "♕"
    else
      "♛"
    end
  end

end