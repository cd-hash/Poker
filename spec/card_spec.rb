require 'card'

describe Card do
    subject(:card) {Card.new('spades', 10, '10')}

    describe '#initialize' do
        it 'has a suit' do
            expect(card.suit).to eq('spades')
        end
        it 'has a numerical value' do
            expect(card.numerical_value).to eq(10)
        end
        it 'has a face value' do
            expect(card.face_value).to eq('10')
        end
    end
end