require_relative 'player.rb'
require_relative 'deck.rb'

class Game
    attr_reader :deck, :players

    def initialize(num_players)
        @deck = Deck.new
        @players = []
        num_players.times do |player|
            @players << Player.new(@deck.deck.shift(5), 100)
        end
    end
end