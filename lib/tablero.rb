class Tablero
	def initialize

	end
	def tinit
		File.open("escenario.txt", "r") { |file|
			tablero(file.gets.split("\t"))
			tagent(file.gets.split("\t"),file)
		}
	end

	def tprint(i=0, j=0)
		begin print @tablero[i][j] ? '*' : ' ' rescue return 0 end
		print (j==@col-1) ? "\n" : ""
		i,j = (j<@col) ? i : i+1, (j<@col) ? j+1 : j-@col
		self.tprint(i,j)
	end
	
	private
	:ren
	:col
	:tablero

	def tablero(array)
		@ren = Integer(array[0])
		@col = Integer(array[1])
		@tablero = Array.new(@ren){Array.new(@col){nil}}
	end

	def tagent(lin, file)
		begin
			@tablero[Integer(lin[0])][Integer(lin[1])] = 1
			self.tagent(file.gets.split("\t"),file)
		rescue
		end
	end

end