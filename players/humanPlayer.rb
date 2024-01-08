require_relative 'player.rb'

class HumanPlayer < Player

    def make_move
        Cursor.get_input()

    end

end