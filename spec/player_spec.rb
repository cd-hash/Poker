require 'player'

describe Player do
    subject(:player) { Player.new(hand, pot) }

    describe '#initialize' do
        it 'receives a Hand object'
        it 'is given some amount greater than zero for its pot'
    end
end