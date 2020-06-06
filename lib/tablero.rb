class Tablero
	def initialize
		# => 
		# => 
		# => 
	end
	
	def tinit
		File.open("escenario.txt", "r") do |buff|
			lin = buff.gets.split("\t")
			@ren = Integer(lin[0])
			@col = Integer(lin[1])
			@tablero = Array.new(@ren) {Array.new(@col) {nil}}
			assignAgent(buff)
		end
	end

	def tprint(i=0, j=0)
		system "clear"
		begin
			print (j==@col-1) ? "\n" : ""
			print @tablero[i][j] ? '*' : ' '
			i += (j<@col) ? 0 : 1
			j += (j<@col) ? 1 : -@col
			tprint(i,j)
		rescue
			0
		end
	end

	private
	:ren
	:col
	:tablero

	def assignAgent(buffer)
		begin
			lin = buffer.gets.split("\t")
			@tablero[Integer(lin[0])][Integer(lin[1])] = 1
			assignAgent(buffer)
		rescue
			0
		end
	end
end