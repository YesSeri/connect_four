# frozen_string_literal: true

require 'pry'

# A player is created.

# Contains info about player. Called to make choice of where to put marker.
class Player
  attr_accessor :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def make_choice(choices)
    puts "Your turn to choose, #{name}."
    puts "Choose which column to put your marker. #{marker}"
    input = ''
    loop do
      input = gets.chomp
      break if choices.to_s.include? input
    end
    input.to_i
  end
end
