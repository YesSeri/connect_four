# frozen_string_literal: true

require_relative 'player'
require 'pry'

EMPTY = '○ '
MARKER_1 = '⊳ '
MARKER_2 = '◍ '
ROWS = 6
COLUMNS = 7

# All the actions happening on the board takes place here. 

class Board

  attr_accessor :positions, :choices, :turn_number, :player1, :player2

  def initialize(name1, name2)
    @positions = Array.new(ROWS) { Array.new(COLUMNS, EMPTY) }
    @choices = [0, 1, 2, 3, 4, 5, 6]
    @turn_number = 0
    @player1 = Player.new(name1, MARKER_1)
    @player2 = Player.new(name2, MARKER_2)
  end

  def play
    take_turn while !check_win && @turn_number < 42
    to_s
    win_or_draw_message
  end

  def win_or_draw_message
    if check_win
      puts "\nGAME WON by #{find_current_player.name.upcase}"
    else
      puts "\nA DRAW between #{@player1.name} and #{@player2.name}"
    end
  end

  def take_turn
    to_s
    @turn_number += 1
    player = find_current_player
    choice = player.make_choice(@choices)
    put_marker(choice, player)
  end

  def find_current_player
    @turn_number.odd? ? @player1 : @player2
  end

  # First value decides height, second value decides column
  def put_marker(choice, player)
    i = 0
    i += 1 while i < ROWS && @positions[i][choice] == EMPTY
    @positions[i - 1][choice] = player.marker
    @choices.delete(choice) if (i - 1).zero?
  end

  def check_win
    true if diagonal_win? || horizontal_win? || vertical_win?
  end

  def horizontal_win?
    (0..5).each do |row|
      (0..3).each do |column|
        return true if horizontal_row_win?(row, column)
      end
    end
    false
  end

  def horizontal_row_win?(row, column)
    return false if @positions[row][column] == EMPTY

    values_to_check = []
    (0..3).each do |i|
      values_to_check << @positions[row][column + i]
    end
    values_to_check.uniq.count == 1
  end

  def vertical_win?
    (0..6).each do |column|
      (0..2).each do |row|
        return true if vertical_row_win?(row, column)
      end
    end
    false
  end

  def vertical_row_win?(row, column)
    return false if @positions[row][column] == EMPTY

    values_to_check = []
    (0..3).each do |i|
      values_to_check << @positions[row + i][column]
    end
    values_to_check.uniq.count == 1
  end

  # Column 3 and row 2 max. Control is diagonal down right.
  def diagonal_win?
    (0..3).each do |column|
      (0..2).each do |row|
        return true if down_right_win?(row, column)
      end
    end
    (3..6).each do |column|
      (0..2).each do |row|
        return true if down_left_win?(row, column)
      end
    end
    false
  end

  def down_right_win?(row, column)
    return false if @positions[row][column] == EMPTY

    values_to_check = []
    (0..3).each do |i|
      values_to_check << @positions[row + i][column + i]
    end
    values_to_check.uniq.count == 1
  end
  def down_left_win?(row, column)
    return false if @positions[row][column] == EMPTY

    values_to_check = []
    (0..3).each do |i|
      values_to_check << @positions[row + i][column - i]
    end
    values_to_check.uniq.count == 1
  end
  def to_s
    puts
    @positions.each do |a|
      print '|'
      a.each do |b|
        print b
      end
      print '|'
      puts
    end
    print " 0 1 2 3 4 5 6\n"
    puts
  end
end
board = Board.new('henrik', 'alio')
board.positions[2][3] = "x "
board.positions[3][2] = "x "
board.positions[4][1] = "x "
board.positions[5][0] = "x "
board.to_s
print board.diagonal_win?
