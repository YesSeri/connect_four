require 'board'
require 'player'

describe Board do
  let(:board) { Board.new('Henrik', 'Alio') }

  it 'is a class' do
    expect(board).to be_instance_of Board
  end
  it 'has variables: board, player_1 and 2, choices, turn_number' do
    expect(board).to respond_to(:positions, :player_1, :player_2, :turn_number, :choices)
  end
  describe 'variables' do 
    describe 'players' do
      it 'has player instances' do
        expect(board.player_1).to be_a Player
        expect(board.player_2).to be_a Player
      end
    end
    describe 'column choices' do
      it 'has choices' do
        expect(board.choices).to eq([0, 1, 2, 3, 4, 5, 6])
      end
    end
    describe 'player names' do
      it 'the names are' do
        expect(board.player_1.name).to eq('Henrik')
      end
      it 'the names are' do
        expect(board.player_2.name).to eq('Alio')
      end
    end
    describe 'turn_number' do
      it 'start is 1' do
        expect(board.turn_number).to eq(1)
      end
    end
  end
  describe 'check for wins' do
    it 'is a horizontal win' do
      board.positions[0][0] = "x"
      board.positions[1][0] = "x"
      board.positions[2][0] = "x"
      board.positions[3][0] = "x"
      expect(board.horizontal_win?).to eq(true)
    end
    it "#vertical win" do
      board.positions[2][0] = "x"
      board.positions[2][1] = "x"
      board.positions[2][2] = "x"
      board.positions[2][3] = "x"
      expect(board.vertical_win?).to eq(true)
    end
    it "#diagonal win" do
      board.positions[1][1] = "x"
      board.positions[2][2] = "x"
      board.positions[3][3] = "x"
      board.positions[4][4] = "x"
      expect(board.diagonal_win?).to eq(true)
    end
  end
end
