class Hand
    attr_reader :my_hand, :hand_value

    def initialize(cards)
        @my_hand = cards
        @hand_value = {}
        calculate_hand
    end

    def calculate_hand
        sorted_cards = sort_hand
        matching_vals = contains_matching_numerical_value(sorted_cards)
        matching_suits = contains_matching_suits(sorted_cards)
        hand_hash = {}
        if contains_sequence?(sorted_cards) #royal flush, straigh flush, straight req. sequence
            if matching_suits.length != 1
                hand_hash['straight'] = 5
            elsif sorted_cards.sum { |card| card.numerical_value} == 55
                hand_hash['royal flush'] = 10
            else
                hand_hash['straight flush'] = 9
            end
        else # four of a kind, full house, flush, 3 of a kind, 2 of a kind, 2 pair, pair, high card
            if matching_suits.length == 1 #flush
                hand_hash['flush'] = 6
            elsif matching_vals.length == 4
                hand_hash['pair'] = 2
            elsif matching_vals.length == 3 # two pair or 3 of a kind
                matching_vals.each_pair do |key, value|
                    hand_hash['two pair'] = 3 if matching_vals[key] == 2
                    hand_hash['three of a kind'] = 4 if matching_vals[key] == 3
                end
            elsif matching_vals.length == 2
                matching_vals.each_pair do |key, value|
                    hand_hash['full house'] = 7 if matching_vals[key] == 3
                    hand_hash['four of a kind'] = 8 if matching_vals[key] == 4
                end
            else
                hand_hash['high card'] = 1
            end
        end

        @hand_value = hand_hash
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

    def contains_matching_numerical_value(sorted_hand)
        matching_numbers = {}
        sorted_hand.each do |card|
            if matching_numbers.include?(card.numerical_value)
                matching_numbers[card.numerical_value] += 1
            else
                matching_numbers[card.numerical_value] = 1
            end
        end
        return matching_numbers
    end

    def contains_matching_suits(sorted_hand)
        matching_suits = {}
        sorted_hand.each do |card|
            if matching_suits.include?(card.suit)
                matching_suits[card.suit] += 1
            else
                matching_suits[card.suit] = 1
            end
        end
        return matching_suits
    end
end