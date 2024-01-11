require_relative 'board.rb'
require_relative 'cursor.rb'
require_relative './players/humanPlayer.rb'

class Game
    attr_reader :board, :display, :current_player, :players

    def initialize
      @board = Board.new
      @display = Display.new(@board)
      @players = {
          white: HumanPlayer.new(:white, @display),
          black: HumanPlayer.new(:black, @display)
      }
      @current_player = :white
    end

    # def play
    #   until board.checkmate?(current_player)
    #     begin
    #       start_pos, end_pos = players[current_player].make_move(board)
    #       board.move_piece(start_pos, end_pos)
    #     rescue RuntimeError => e
    #       puts e.message
    #       retry
    #     end
    #     swap_turn!
    #     notify_players
    #   end

    #   display.render
    #   puts "#{current_player} is checkmated."
    #   nil
    # end

      def play
        until board.checkmate?(current_player)
          begin
            # Prompt the current player to make a move
            start_pos, end_pos = players[current_player].make_move(board)

            # Attempt to move the piece
            board.move_piece(start_pos, end_pos)

            # If successful, swap turn and perform other necessary updates
            swap_turn!
            # ... any other turn-related logic ...

          rescue RuntimeError => e
            # Catch the error raised from board.move_piece
            # Display the error message to the player
            puts "Error: #{e.message}"
            # Optionally, add a brief pause
            sleep(1.5)
            # No need to call 'retry' here since the loop will continue
          end
        end
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
      Game.new.play
    end


end

chess = Game.new
chess.play