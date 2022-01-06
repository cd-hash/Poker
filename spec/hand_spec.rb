require 'hand'

describe Hand do
    subject(:hand) { Hand.new([]) }

    describe '#initialize' do
        it 'stores #my_hand as an array' do 
            expect(hand.my_hand).to be_an_instance_of(Array)
        end
    end

    describe '#calculate_hand' do
        it 'sorts the cards' do
            expect(hand.my_hand).to receive(:sort) # always call method after receive call
            hand.calculate_hand
        end
        it 'checks if the cards numerical value is in sequnce'
        it 'checks if there are any matching numerical values'
        it 'checks if there are any matching suits'
        it 'returns the classification and its associated ranking to the hand'
    end
end