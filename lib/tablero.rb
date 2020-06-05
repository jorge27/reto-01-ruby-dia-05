class Tablero
	def initTablero
		File.open('escenario.txt', "r") do |buff|
			lin = buff.gets.split("\t")
			@ren = Integer(lin[0])
			@col = Integer(lin[1])
			@tablero = Array.new(@ren) {Array.new(@col) {nil}}
			while lin = buff.gets
				lin = lin.split("\t")
				@tablero[Integer(lin[0])][Integer(lin[1])] = 1
			end
		end
	end

	def printT
		system "clear"
		for i in 0..@col+1
			print "-"
		end
		print "\n"
		for i in 0..@ren-1
			print "|"
			for j in 0..@col-1
				print @tablero[i][j] ? "*" : " "		
			end
			print "|"
			print "\n"
		end
		for i in 0..@col+1
			print "-"
		end
	end
	
	private
	:ren
	:col
	:tablero
	
end