# Here the game is initiated and instructions are shown. 
# Majority of work takes place inside board.rb.

require_relative 'board'

def get_name(number)
  puts "Player #{number}, what is your name?"
  gets.chomp
end

def print_title
  puts '
 _______  _______  _        _        _______  _______ _________
(  ____ \(  ___  )( (    /|( (    /|(  ____ \(  ____ \\\\__   __/
| (    \/| (   ) ||  \  ( ||  \  ( || (    \/| (    \/   ) (   
| |      | |   | ||   \ | ||   \ | || (__    | |         | |   
| |      | |   | || (\ \) || (\ \) ||  __)   | |         | |   
| |      | |   | || | \   || | \   || (      | |         | |   
| (____/\| (___) || )  \  || )  \  || (____/\| (____/\   | |   
(_______/(_______)|/    )_)|/    )_)(_______/(_______/   )_(   
                                                               
             _______  _______           _______ 
            (  ____ \(  ___  )|\     /|(  ____ )
            | (    \/| (   ) || )   ( || (    )|
            | (__    | |   | || |   | || (____)|
            |  __)   | |   | || |   | ||     __)
            | (      | |   | || |   | || (\ (   
            | )      | (___) || (___) || ) \ \__
            |/       (_______)(_______)|/   \__/'
end

def print_instructions
  print "\nConnect four in a row, vertically, horizontally or diagonally.\n\n"
end

def pre_game 
  print_title
  print_instructions
end

def start_game
  name1 = get_name(1)
  name2 = get_name(2)
  game = Board.new(name1, name2)
  game.play
end
def game_loop
  loop do
    start_game
    puts "\nPlay again?"
    
    break if gets.chomp[0].upcase == 'N'
  end
  puts "GAME ENDED"
end
pre_game
game_loop
