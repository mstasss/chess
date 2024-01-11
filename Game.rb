require_relative 'board.rb'
require_relative 'cursor.rb'
require_relative './players/humanPlayer.rb'

class Game
    attr_reader :board, :display, :current_player, :players
    def initialize ()
        @board = Board.new
        @display = Display.new(@board)
        @players = {
            player_1: HumanPlayer.new(:white, @display),
            player_2: HumanPlayer.new(:black, @display)
        }
        @current_player = :white
    end

    def play
        until board.in_check?(current_player)
          begin
            start_pos, end_pos = players[current_player].make_move(board)
            board.move_piece(current_player, start_pos, end_pos)
            swap_turn!
            notify_players
          rescue StandardError => e
            @display.notifications[:error] = e.message
            retry
          end
        end

        display.render
        puts "#{current_player} is checkmated."

        nil
    end


  private

    def notify_players
        puts "it's #{@current_player}'s turn"
    end

    def swap_turn!
        @current_player = current_player == :white ? :black : :white
    end

    if $PROGRAM_NAME == __FILE__
      puts "yay"
        #Game.new.play
    end


end

# chess = Game.new
# chess.play