require_relative "board,card"

class Game 
    def play 
        @board.render
         input = gets.chomp
    end 

end 