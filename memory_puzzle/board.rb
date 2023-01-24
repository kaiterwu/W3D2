require_relative "card"
class Board 


    def initialize(size)
        @grid = Array.new(size) {Array.new(size," ")}
        @size = size * size # this has to be even 
    end 

    def populate
         random_array = []

        until random_array.length == @size

            x = rand(0..@grid.length - 1)
            y = rand(0..@grid.length - 1)

            random_array << [x,y] unless random_array.include?([x,y])

        end

        value_arr = [] 

        while value_arr.length < @size/2
            card = Card.new
            value_arr << card unless value_arr.include?(card)
        end 

        shuffled_arr = []
        value_arr.each {|ele|shuffled_arr << ele.dup}

        match_arr = value_arr.concat(shuffled_arr)
        counter = Hash.new(0)

        random_array.each_with_index do |position,i|
            @grid[position[0]][position[-1]] = match_arr[i]
        end
    end

    

    def render
        hidden_grid = Array.new(grid.length){Array.new(grid.length)}
        hidden_grid.each_with_index do |row,i|
            row.each_with_index do |card,j|
                if @grid[i][j].face_bool == false 
                    hidden_grid[i][j] = '_'
                else  
                    hidden_grid[i][j] = @grid[i][j].face_value
                end 
            end 
        end 
    
        puts "  #{(0..hidden_grid.length-1).to_a.join(" ")}"
        hidden_grid.each_with_index do |sub,i|
            puts "#{i} #{sub.join(" ")}"
        end 
    end 

    

    def grid
        @grid
    end



    def won? 
        @grid.all?{|row|row.all?{|ele|ele.face_bool == true}}
    end 

    def guess_check #position is a 1D array 
    
        self.render

        puts "Please enter a coordinate separated by space, ie 0 0 : "
        position = gets.chomp.scan(/\d/).first(2)
        guess_1 = @grid[position[0].to_i][position[-1].to_i]
        guess_1.face_bool = true 
        self.render 

        begin

        puts "Please enter another coordinate separated by space, ie 0 0 : "
        position_2 = gets.chomp.scan(/\d/).first(2)
            if position == position_2 
                raise "Not valid input"
            end 
            rescue 
                puts "Try again"
                retry 
            end
      
        guess_2 = @grid[position_2[0].to_i][position_2[-1].to_i]
        guess_2.face_bool = true 
        self.render 

        if guess_1.face_value != guess_2.face_value
            guess_1.face_bool,guess_2.face_bool = false,false
        end 
        


    end 

end 


