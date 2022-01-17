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

    def see(current_bet)
        @pot = @pot - current_bet
        return current_bet
    end

    def increase(current_bet, raise_amount)
        @pot = @pot - (current_bet + raise_amount)
        return current_bet + raise_amount
    end

    def fold
        return false
    end

    def show_hand
        puts @hand.my_hand
    end

    def discard_cards(cards_to_dsicard)
        @hand.discard_cards(cards_to_dsicard)
        return cards_to_dsicard.length
    end
end