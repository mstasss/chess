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


class Board

  attr_accessor :pieces

  LENGTH = 8

  def initialize
    @np = NullPiece.instance()
    @board = Array.new(8) { Array.new(LENGTH, @np) }
    self.place_pieces
  end

  def place_non_pawns_row(color)
    row_i = color == :white ? 0 : 7
    order = ["Rook","Knight","Bishop","King","Queen","Bishop","Knight","Rook"]
    order.each_with_index do |piece_type,i|
      position = [row_i,i]
      piece_class = Kernel.const_get(piece_type)
      @board[row_i][i] = piece_class.new(color,self,position)
    end
  end

  def place_pawns_row(color)
    row_i = color == :white ? 1 : 6
    8.times do |i|
      position = [row_i,i]
      @board[row_i][i] = Pawn.new(color,self,position)
    end
  end

  def place_pieces
    [:black,:white].each do |color|
      self.place_non_pawns_row(color)
      self.place_pawns_row(color)
    end
  end

  def board_printer(real_board=board)
    board.each do |row|
      emoji_row = []
      row.map do |emoji|
        emoji_row << emoji.to_s
      end
      p emoji_row
    end
    nil
  end

  def board
    @board.each do |row|
      p row
    end
  end

  def move_piece(start_pos, end_pos)
    raise if start_pos.nil? || valid_pos?(end_pos) == false
    self[*end_pos] = self[*start_pos]
    self[*start_pos] = @np
    self[*end_pos].pos = end_pos
  end


  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, value)
    @board[row][col] = value
  end

  def valid_pos?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def length
    LENGTH
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    pieces.any? do |p|
      p.color != color && p.moves.include?(king_pos)
    end
  end

  def find_king(color)
    king_pos = pieces.find { |p| p.color == color && p.is_a?(King) }
    king_pos || (raise 'king not found?')
  end

  def dup
    new_board = Board.new
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        next if piece.is_a?(NullPiece)
        new_board[row_idx, col_idx] = piece.dup_with_new_board(new_board)
      end
    end
    new_board
  end




  private

  attr_reader :board

end
