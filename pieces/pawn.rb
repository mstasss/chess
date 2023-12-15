require_relative 'piece.rb'

WHITE_SIDE_ATTACKS = [[1,-1],[1,1]]
BLACK_SIDE_ATTACKS = [[-1,-1],[-1,1]]

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

  # private

  def at_start_row?
    (self.color == :white && self.pos[0] == 1) || (self.color == :black && self.pos[0] == 6)
  end

  def forward_dir
    if self.color == :white
      1
    else
      -1
    end
  end

  def forward_steps
    if at_start_row?
      [0,2 * forward_dir] #steps
    else
      [0,forward_dir]
    end
  end

  def side_attacks
    if self.color == :black
      return get_dirs(self.pos,BLACK_SIDE_ATTACKS)
    else
      return get_dirs(self.pos,WHITE_SIDE_ATTACKS)
    end
  end

  def get_dirs(pos,dirs)
    moves = []
    starting_row = pos[0]
    starting_col = pos[1]
    dirs.each do |(row_change,col_change)|
      new_row,new_col = starting_row + row_change,starting_col + col_change
        if self.color == board[new_row,new_col].color
          break
        end
        moves << [new_row, new_col]
        new_row += row_change
        new_col += col_change
    end
    moves
  end

end