require 'deck'

describe Deck do
    subject(:deck) { Deck.new }

    describe '#initialize' do
        it 'creates a deck array' do
            expect(deck.deck).to be_an_instance_of(Array)
        end

        it 'has 52 cards in the deck' do
            expect(deck.deck.length).to eq(52)
        end

        it 'has 13 cards for each suit'

        it 'has 12 face cards'
    end
end