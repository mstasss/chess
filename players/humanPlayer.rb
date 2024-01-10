require_relative 'player.rb'
require_relative '../cursor.rb'

class HumanPlayer < Player

    def make_move(board)
        turn = Cursor.new([0,0],board) #how does it get the position
        turn.get_input()
    end

end