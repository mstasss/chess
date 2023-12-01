class Piece
  def initialize; end

  def moves
    # should return an array of places a Piece can move to.

    # so you can't write (implement) the #moves method of Piece without subclasses.
  end
end

class NullPiece < Piece
end