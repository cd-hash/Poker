require_relative 'card'

class Deck
    attr_reader :deck
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'King', 'Queen', 'Jack', 'Ace']

    def initialize()
        @deck = []
        CARDS.each do |card|
            SUITS.each { |suit| @deck << Card.new(suit, card) }
        end
    end
end