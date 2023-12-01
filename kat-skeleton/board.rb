require_relative 'piece.rb'

class Board
  def initialize
    setup_board
  end

  # takes in a position that is horizontal, vertical
  def [](pos)
    horizontal, vertical = parse_position_values(pos)
    
    board[horizontal][vertical]
  end

  def []=(pos, val)
    horizontal, vertical = parse_position_values(pos)
    board[horizontal][vertical] = val
  end

  def move_piece(start_pos, end_pos)
    raise('There is no piece to move!!') if self[start_pos].nil?
    raise('Cannot move to end_pos') unless self[end_pos].nil?

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    # This should update the 2D grid and also the
    # moved piece's position. You'll want to raise an exception if:

    # there is no piece at start_pos or
    # the piece cannot move to end_pos.
  end

  private

  attr_reader :board

  def parse_position_values(pos)
    horizontal, vertical = pos.split(',').map!(&:to_i)
    
    raise('invalid position!') unless horizontal.between?(0, 7) && vertical.between?(0, 7)
    
    [horizontal, vertical]
  end

  def setup_board
    @board = Array.new(8) { Array.new(8, nil) }
    
    [0, 1, 6, 7].each do |row|
      8.times do |column|
        board[row][column] = Piece.new
      end
    end
  end
end
