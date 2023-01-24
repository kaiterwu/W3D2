require_relative "board"
require_relative "card"

class Game 

    def initialize(size=4)
        @board = Board.new(size)
    end 

    def play 
        @board.populate 
        while !@board.won?
            @board.guess_check 
        
        end 

        puts "You win! "
     end 

end 