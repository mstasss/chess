require_relative 'piece.rb'

class Pawn < Piece
  def symbol
    return :P 
  end  

  def moves
  end

  def to_s
    if color == :white
      return "♙"
    else
      "♟️"
    end
  end

  private

  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end

end