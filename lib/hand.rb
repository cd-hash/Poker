class Hand
    attr_reader :my_hand

    def initialize(cards)
        @my_hand = cards
    end

    def calculate_hand
        sorted_hand = @my_hand.sort { |a, b| a.numerical_value <=> b.numerical_value }
    end
end