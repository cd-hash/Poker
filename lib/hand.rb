class Hand
    attr_reader :my_hand

    def initialize(cards)
        @my_hand = cards
    end

    def calculate_hand
        
    end

    def sort_hand
        sorted_hand = @my_hand.sort { |a, b| a.numerical_value <=> b.numerical_value }
    end

    def contains_sequence?(sorted_hand)
        i = sorted_hand[0].numerical_value
        sorted_hand.each do |card|
            return false unless i == card.numerical_value
            i += 1
        end
        return true
    end
end