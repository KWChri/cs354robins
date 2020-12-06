class Card
    attr_accessor :color, :suit, :value
    
    def initialize (x,y,z)
        @color = x
        @suit = y
        @value = z
    end

    def prnt
        puts "I am a #{@value} of #{@suit}"
    end
end