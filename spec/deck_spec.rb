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

        it 'has 13 cards for each suit' do
            suit_counter = {spades: 0, hearts: 0, diamonds: 0, clubs: 0}
            deck.deck.each do |card|
                suit_counter[card.suit] += 1
            end

            expect(suit_counter[:spades]).to eq(13)
            expect(suit_counter[:hearts]).to eq(13)
            expect(suit_counter[:diamonds]).to eq(13)
            expect(suit_counter[:clubs]).to eq(13)
        end

        it 'has 12 face cards' do
            face_counter = 0
            faces = ['King', 'Queen', 'Jack', 'Ace']
            deck.deck.each do |card|
                face_counter += 1 if faces.include?(card.face_value)
            end
        end
    end
end