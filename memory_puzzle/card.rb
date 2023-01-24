class Card 

    attr_accessor :face_value, :face_bool 

    def initialize
    
        @face_value =("A".."Z").to_a.sample 
        @face_bool = false  
    end  

    def hide 
        @face_bool = false 
    end 

    def reveal 
        @face_bool = true 
    end 

    # def to_s 
    #     @face_value.to_s 

     
end 