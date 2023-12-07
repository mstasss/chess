require 'pry'
module Slideable
  HORIZ_VERT_DIRS = []
  DIAGONAL_DIRS = []

  def moves
    #kats moves Method
    #trying to get all possible MOVES
    #what are the move direction options
    #add to my possible moves, diags if i'm allowed ot move diagnoally
    #add horiztonals if I'm allowed ot move horizontally
    #return all possible moves
    #------

      #if piece can move diagonally, use helper method to get those moves
      #if piece can move horiztonally/vertical, use helper method to get those moves
      filter { |move| board.valid_pos?(move) }.
      filter { |positions| self.color != board[*positions].color }
    #return all real moves
  end
  #still learning git/hub. Added the below function
  def diagonal_moves(pos)
    diag_moves = []
    starting_row = pos[0]
    starting_col = pos[1]

    #This will check positions from current position to top-right
    new_row,new_col = starting_row + 1,starting_col+ 1
    row_change = 1
    col_change = 1
    while board.valid_pos?(new_row,new_col)
      diag_moves << [new_row, new_col]
      new_row += row_change
      new_col += col_change
    end
    #while new generated position is valid, do this thing...

    #this will check positions from current position to bottom-left

    new_row,new_col = starting_row - 1,starting_col - 1
    row_change = -1
    col_change = -1
    while board.valid_pos?(new_row,new_col)
      diag_moves << [new_row, new_col]
      new_row += row_change
      new_col += col_change
    end

    #this will check positions from current position to Top-left
    new_row,new_col = starting_row - 1,starting_col + 1
    row_change = -1
    col_change = 1
    while board.valid_pos?(new_row,new_col)
      diag_moves << [new_row, new_col]
      new_row += row_change
      new_col += col_change
    end

    #This will check positions from current poition to bottom-right
    new_row,new_col = starting_row + 1,starting_col - 1
    row_change = 1
    col_change = -1
    while board.valid_pos?(new_row,new_col)
      diag_moves << [new_row, new_col]
      new_row += row_change
      new_col += col_change
    end

    diag_moves
  end

  def horizontal_dirs(pos) #horiztonal_vertical moves
    #starting position = [3,4]
    #horizontal =
    new_arr = []
    starting_row = pos[0]
    starting_col = pos[1]
    i = 0
    while i <= board.length - 1
      if i == starting_row
        i += 1
      else
        new_arr << [i, starting_col]
        i += 1
      end
    end

    i = 0
    while i <= board.length - 1
      if i == starting_col
        i+= 1
      else
        new_arr << [starting_row, i]
        i += 1
      end
    end

    new_arr

  end


  #SLIDEABLE PIECES
  #bishop/rook/queen

  #bishop = diagnoal
  # starting = [3,3]
  # possible moves are [0,0],[1,1],[2,2][4,4] && [6,0][5,1],[4,2],[2,4],[1,5]
  #aka either add/subtract same number from both sides (3-3,3-3 = 0,0), or opposite number (3+3,3-3 = 6,0)

  #rook = horizontal/vertical
  #starting = [3,3]
  #possible = [0,3][1,3][2,3][4,3][5,3] && [3,0],[3,1][3,2][3,4][3,5][3,6][3,7]
  #aka +1 to first number only (3+1,3 = 4,3) or second number only (3,3-1 = 3,2)

  #queen = horizontal, vertical, and diagnoal
  #starting = [3,3]
  #possible = all moves from two above

  #CHESSBOARD IN POSITIONS
  # [0,0] [0,1] [0,2] [0,3] [0,4] [0,5] [0,6] [0,7]
  # [1,0] [1,1] [1,2] [1,3] [1,4] [1,5] [1,6] [1,7]
  # [2,0] [2,1] [2,2] [2,3] [2,4] [2,5] [2,6] [2,7]
  # [3,0] [3,1] [3,2] [3,3] [3,4] [3,5] [3,6] [3,7]
  # [4,0] [4,1] [4,2] [4,3] [4,4] [4,5] [4,6] [4,7]
  # [5,0] [5,1] [5,2] [5,3] [5,4] [5,5] [5,6] [5,7]
  # [6,0] [6,1] [6,2] [6,3] [6,4] [6,5] [6,6] [6,7]
  # [7,0] [7,1] [7,2] [7,3] [7,4] [7,5] [7,6] [7,7]

end

# {up_left=>[1,2],[3,4]; down_left=>[3,4],[5,6]}

