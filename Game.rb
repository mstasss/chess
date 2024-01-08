require_relative 'board.rb'
require_relative 'cursor.rb'
require_relative './players/player.rb'



class Game 

    def initialize ()
        @board = Board.new
        @display = Display.new(@board)
        @players = {player_1: Player.new(:white), player_2: Player.new(:black)}
        @current_player = :player_1.color
    end

    def play

        notify_players
        HumanPlayer.make_move()
        swap_turn! 

    end


  private
    
    def notify_players
        puts "it's #{@current_player}'s turn"
    end

    def swap_turn! 
        @current_player.color == :white ? @current_player = :player_2 : @current_player = :player_1
    end
end

# chess = Game.new
# chess.play