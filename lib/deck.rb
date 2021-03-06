require_relative 'card'

class Deck
    attr_reader :deck
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

    def initialize()
        @deck = []
        CARDS.each do |card|
            value = 1
            SUITS.each { |suit| @deck << Card.new(suit, value, card) }
            value += 1
        end
        @deck.shuffle!
    end
end