require_relative 'lib/game.rb'
require_relative 'lib/board.rb'
require_relative 'lib/moves.rb'
Dir["lib/pieces/*.rb"].each {|file| require_relative file}

game = Game.new