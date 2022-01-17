require_relative 'hand.rb'

class Player
    attr_reader :hand, :pot

    def initialize(cards, pot)
        @hand = Hand.new(cards)
        @pot = pot
    end

    def get_user_input(current_bet)
        puts 'Player would you like to See, Raise, Fold'
        cmd, raise_amount = gets.chomp.split(' ')
        
        case cmd
        when 'See'
            see(current_bet)
        when 'Raise'
            increase(current_bet, raise_amount)
        when 'Fold'
            fold
        end
    end

    def swap_cards?
        puts 'would you like to swap any of your cards?'
        cmd, *cards_to_discard = gets.chomp.split(' ')

        case cmd
        when 'Yes'
            discard_cards(cards_to_discard)
        when 'No'
            return
        end
    end

    def see(current_bet)
        @pot = @pot - current_bet
        return [:see, current_bet]
    end

    def increase(current_bet, raise_amount)
        @pot = @pot - (current_bet + raise_amount)
        return [:raise, (current_bet + raise_amount)]
    end

    def fold
        return [:fold]
    end

    def show_hand
        puts @hand.my_hand
        puts @hand.hand_value
    end

    def discard_cards(cards_to_dsicard)
        @hand.discard_cards(cards_to_dsicard)
        return cards_to_dsicard.length
    end
end