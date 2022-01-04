require 'hand'

describe Hand do
    subject(:hand) { Hand.new([]) }

    describe '#initialize' do
        it 'stores #my_hand as an array' do 
            expect(hand.my_hand).to be_an_instance_of(Array)
        end
    end
end