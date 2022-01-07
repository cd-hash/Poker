require 'hand'

describe Hand do
    subject(:hand) { Hand.new([]) }

    describe '#initialize' do
        it 'stores #my_hand as an array' do 
            expect(hand.my_hand).to be_an_instance_of(Array)
        end
    end
    #create card doubles to test calculations
    let(:king) { double('card', :numerical_value => 12, :face_value => 'spades') }
    let(:queen) { double('card', :numerical_value => 11, :face_value => 'spades') }
    let(:ten) { double('card', :numerical_value => 9, :face_value => 'spades') }
    let(:five) { double('card', :numerical_value => 4, :face_value => 'spades') }
    let(:seven) { double('card', :numerical_value => 6, :face_value => 'spades') }

    let(:sorted_hand) { [five, seven, ten, queen, king] }

    subject(:hand_with_cards) { Hand.new([king, five, ten, seven, queen]) }

    describe '#calculate_hand' do
        it 'checks if there are any matching numerical values'
        it 'checks if there are any matching suits'
        it 'returns the classification and its associated ranking to the hand'
    end

    describe '#sort_hand' do
        
        it 'sorts the cards' do
            expect(hand.my_hand).to receive(:sort) # always call method after receive call
            hand.sort_hand
            expect(hand_with_cards.sort_hand).to eq( [five, seven, ten, queen, king] )
        end
    end

    describe '#contains_sequence?' do
        it 'checks if our hand contains cards in a numerical sequence' do
            expect(hand.contains_sequence?(sorted_hand)).to eq(false)
        end
    end
end