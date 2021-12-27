require_relative 'card'

class Deck
    attr_reader :deck

    def initialize()
        @deck = []
        52.times do 
            @deck << Card.new('spade', 1, '1')
        end
    end
end