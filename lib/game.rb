require_relative 'player.rb'
require_relative 'deck.rb'

class Game
    attr_reader :deck, :players, :current_bet

    def initialize(num_players, starting_bet)
        @deck = Deck.new
        @players = []
        num_players.times do |player|
            @players << Player.new(@deck.deck.shift(5), 100)
        end
        @current_bet = starting_bet
        @pot = 0
    end

    def play
        betting_round
        discard_round
        show_hands_round
    end

    def betting_round
        folding_players = []
        @players.each_with_index do |player, index|
            cmd, bet = player.get_user_input(@current_bet)

            case cmd
            when :see
                @pot += bet
            when :raise
                @pot += bet
                @current_bet = bet
            when :fold
                folding_players << index
            end
        end
        folding_players.each { |player_index| @players.delete_at(player_index)}
    end

    def discard_round
        @players.each do |player|
            player.swap_cards?
        end
    end

    def show_hands_round
        @players.each do |player|
            player.show_hand
        end
    end
end