require 'hand'

describe Hand do
    #create card doubles to test calculations
    let(:king) { double('card', :numerical_value => 12, :suit => 'spades', :face_value => 'king') }
    let(:queen) { double('card', :numerical_value => 11, :suit => 'spades', :face_value => 'queen') }
    let(:ten) { double('card', :numerical_value => 9, :suit => 'spades', :face_value => 'ten') }
    let(:five) { double('card', :numerical_value => 4, :suit => 'spades', :face_value => 'five') }
    let(:seven) { double('card', :numerical_value => 6, :suit => 'spades', :face_value => 'seven') }

    subject(:hand_with_cards) { Hand.new([king, five, ten, seven, queen]) }

    let(:sorted_hand) { [five, seven, ten, queen, king] }

    describe '#initialize' do
        it 'stores #my_hand as an array' do 
            expect(hand_with_cards.my_hand).to be_an_instance_of(Array)
        end
    end

    describe '#calculate_hand' do
        
        
        it 'returns the classification and its associated ranking to the hand' do
            expect(hand_with_cards.hand_value).to eq( {'flush' => 6} )
        end
    end

    describe '#sort_hand' do
        
        it 'sorts the cards' do
            expect(hand_with_cards.my_hand).to receive(:sort) # always call method after receive call
            hand_with_cards.sort_hand
            #expect(hand_with_cards.sort_hand).to eq( [five, seven, ten, queen, king] )
        end
    end

    describe '#contains_sequence?' do
        it 'checks if our hand contains cards in a numerical sequence' do
            expect(hand_with_cards.contains_sequence?(sorted_hand)).to eq(false)
        end
    end

    describe '#contains_matching_numerical_value' do
        it 'checks if there are any matching numerical values' do
            expect(hand_with_cards.contains_matching_numerical_value(sorted_hand)).to eq({4 => 1, 6 => 1, 9 => 1, 11 => 1, 12 => 1})
        end
    end

    describe '#contains_matching_suits' do
        it 'checks if there are any matching suits' do 
            expect(hand_with_cards.contains_matching_suits(sorted_hand)).to eq({'spades' => 5})
        end
    end
end