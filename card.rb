class Card
    def initialize(*properties)
        @card_rank     = properties[0]
        @card_suit     = properties[1]

        @number_ranks  = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
        @face_ranks    = ["ace", "jack", "queen", "king"]

        ## local array for special cases
        @special_case  = ["1", "11", "12", "13"]

        ## If card number is '1' convert it to 'ace'
        ## same for 11, 12, 13 .. jack, queen, king
        for i in 0..@special_case.length 
            if properties[0] == @special_case[i]
                @card_rank = @face_ranks[i]
                break;
            else 
                @card_rank = properties[0]
            end
        end
    end

    def create_card
        _card = [@card_rank, @card_suit]
    end

    def is_valid
        if is_suit_valid && is_rank_valid
            return true
        else 
            return false
        end  
    end

    def is_suit_valid
        _card_suits   = ["hearts", "diamonds", "clubs", "spades"]       
        _contains_flag= false

        _card_suits.each do |suit|
            if @card_suit == suit
                _contains_flag = true
            end
        end

        return _contains_flag
    end

    def is_rank_valid
        _contains_flag = false

        @number_ranks.each do |rnk|
            if @card_rank == rnk
                _contains_flag = true
            end
        end

        @face_ranks.each do |rnk|
            if @card_rank == rnk
                _contains_flag = true
            end
        end

        @special_case.each do |rnk|
            if @card_rank == rnk
                _contains_flag = true
            end
        end

        return _contains_flag
    end
end
