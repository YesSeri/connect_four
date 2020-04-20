require 'player'

describe Player do
  let(:player) { Player.new('Henrik', 'X') }

  it 'has name' do
    expect(player.name).to eq('Henrik')
  end
  it 'has marker' do
    expect(player.marker).to eq('X')
  end
end
