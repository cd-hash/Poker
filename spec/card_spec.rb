require 'card'

describe Card do
    subject(:card) {Card.new('spades', 10, '10')}

    describe '#initialize' do
        it 'has a suit' do
            expect(card.suit).to eq('spades')
        end
        it 'has a face value' do
            expect(card.face_value).to eq('10')
        end
        it 'has a name' do
            expect(card.name).to eq('10 of spades')
        end
    end
end