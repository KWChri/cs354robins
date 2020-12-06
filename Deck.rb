class Deck {
    deck = [52]
    dcurrent=0
    def createSpades
        x=0
        for x in 1..13
            card = Card.new()
            card.color = "Black"
            card.suit = "Spade"
            if x==1
                card.value = "Ace"
            end
            if 2<=x<=10
                card.value = x
            end
            if x==11
                card.value = "Jack"
            end
            if x==12
                card.value = "Queen"
            end
            if x==13
                card.value = "King"
            end
        deck[dcurrent] = card
        dcurrent++    
        end
    end

    def createClubs
        x=0
        for x in 1..13
            card = Card.new()
            card.color = "Black"
            card.suit = "Club"
            if x==1
                card.value = "Ace"
            end
            if 2<=x<=10
                card.value = x
            end
            if x==11
                card.value = "Jack"
            end
            if x==12
                card.value = "Queen"
            end
            if x==13
                card.value = "King"
            end
        deck[dcurrent] = card
        dcurrent++    
        end
    end

    def createDiamonds
        x=0
        for x in 1..13
            card = Card.new()
            card.color = "Red"
            card.suit = "Diamond"
            if x==1
                card.value = "Ace"
            end
            if 2<=x<=10
                card.value = x
            end
            if x==11
                card.value = "Jack"
            end
            if x==12
                card.value = "Queen"
            end
            if x==13
                card.value = "King"
            end
        deck[dcurrent] = card
        dcurrent++    
        end
    end

    def createHeart
        x=0
        for x in 1..13
            card = Card.new()
            card.color = "Red"
            card.suit = "Heart"
            if x==1
                card.value = "Ace"
            end
            if 2<=x<=10
                card.value = x
            end
            if x==11
                card.value = "Jack"
            end
            if x==12
                card.value = "Queen"
            end
            if x==13
                card.value = "King"
            end
        deck[dcurrent] = card
        dcurrent++    
        end
    end

    def shuffle

    end

    def getHand

    end
}