class Board
  attr_accessor :positions, :choices, :turn_number, :player_1, :player_2
  def initialize(name_1, name_2)
    @positions = Array.new(7) { Array.new(6, '.') }
    @choices = [0, 1, 2, 3, 4, 5, 6]
    @turn_number = 1
    @player_1 = Player.new(name_1, 'x')
    @player_2 = Player.new(name_2, 'o')
  end
end
