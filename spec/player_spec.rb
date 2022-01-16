require 'player'

describe Player do
    #create card doubles to test calculations
    let(:king) { double('king', :numerical_value => 12, :suit => 'spades', :face_value => 'king', :name => 'king of spades') }
    let(:queen) { double('queen', :numerical_value => 11, :suit => 'spades', :face_value => 'queen', :name => 'queen of spades') }
    let(:ten) { double('ten', :numerical_value => 9, :suit => 'spades', :face_value => 'ten', :name => '10 of spades') }
    let(:five) { double('five', :numerical_value => 4, :suit => 'spades', :face_value => 'five', :name => '5 of spades') }
    let(:seven) { double('seven', :numerical_value => 6, :suit => 'spades', :face_value => 'seven', :name => '7 of spades') }

    let(:cards) { [five, seven, ten, queen, king] }
    let(:cards_to_remove) { ['5 of spades', '7 of spades'] }
    let(:pot) { 100.0 }
    let(:current_bet) { 1.0 }
    let(:increase_bet) { 3.0 }

    subject(:player) { Player.new(cards, pot) }

    describe '#initialize' do
        it 'receives a Hand object' do
            expect(player.hand).to be_an_instance_of(Hand)
            expect(player.hand.my_hand).to eq(cards)
        end
        it 'is given some amount greater than zero for its pot' do
            expect(player.pot).to be > 0
        end
    end

    describe '#see' do
        it 'subtracts the current bet from our pot' do
            player.see(current_bet)
            expect(player.pot).to eq(pot - current_bet)
        end
        it 'gives that money to the game pot' do
            expect(player.see(current_bet)).to eq(current_bet)
        end
    end

    describe '#increase' do
        it 'subtracts the amount the player from the player\'s pot' do
            player.increase(current_bet, increase_bet)
            expect(player.pot).to eq( pot - (current_bet + increase_bet) )
        end
        it 'gives that money to the game pot' do
            expect( player.increase(current_bet, increase_bet) ).to eq(current_bet + increase_bet)
        end
    end

    describe '#fold' do
        it 'tells the game that this player is out' do
            expect(player.fold).to be false
        end
    end

    describe '#discard_cards' do
        it 'calls Hand#discard_cards' do
            expect(player.hand).to receive(:discard_cards).with(cards_to_remove)
            player.discard_cards(cards_to_remove)
        end
        it 'tells the game how many cards were discarded' do
            expect(player.discard_cards(cards_to_remove)).to eq(2)
        end
    end
end