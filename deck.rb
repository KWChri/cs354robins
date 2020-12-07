require_relative 'card'

class Deck 

  attr_reader :Deck

    def initialize
        @Deck = []
        @suits = ["hearts", "diamonds", "clubs", "spades"]

        @suits.each do |suit|
            for i in 1..13
                # Creating a new card, pass it value of "i" and converting it to string, using "to_s" Method
                # which ruby programming language provides us. 
                _myCard = Card.new(i.to_s, suit)
                # once the card object is created. we can call create_method 
                # to get the card in _temp_card local variable
                _temp_card = _myCard.create_card()
                # After we get the card, we push the card to the DECK :) as simple as that ;)
                @Deck << _temp_card
            end
        end
    end

    def shuffle
      @Deck.shuffle!()
    end

    def pop
      @Deck.pop()
    end

    def length
      @Deck.length()
    end

    def display_deck
        print @Deck
    end
end
