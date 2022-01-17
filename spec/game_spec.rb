require 'game'

describe Game do
    subject(:game) { Game.new(4) }

    describe '#initialize' do
        it 'creates a deck' do
            expect(game.deck).to be_an_instance_of(Deck)
        end
        it 'creates an array of the number of players that want to play' do
            expect(game.players.length).to eq(4)
        end
    end
end