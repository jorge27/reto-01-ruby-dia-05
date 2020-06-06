require_relative "lib/tablero"
require_relative "lib/game"

game = Game.new
hilo = Thread.start{game.game}
gets.chomp
Thread.kill(hilo)