require_relative "lib/tablero"
require_relative "lib/game"


aux = nil

juego = Game.new

hilo = Thread.start{juego.game}
aux = gets.chomp
Thread.kill(hilo)
