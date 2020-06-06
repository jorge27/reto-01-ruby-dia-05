require_relative "lib/tablero"
require_relative "lib/game"

juego = Game.new
hilo = Thread.start{juego.game}
gets.chomp
Thread.kill(hilo)
