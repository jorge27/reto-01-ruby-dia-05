class Game < Tablero
	def initialize
		self.initTablero
	end
	
	def gexec
		tablero = Array.new(@ren) {Array.new(@col) {nil}}
		for i in 0..@ren-1
			for j in 0..@col-1
				flag = 0
				begin
					flag += @tablero[i-1][j-1] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i][j-1] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i+1][j-1] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i-1][j] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i+1][j] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i-1][j+1] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i][j+1] ? 1 : 0
				rescue
					# => 
				end
				begin
					flag += @tablero[i+1][j+1] ? 1 : 0
				rescue
					# => 
				end

				tablero[i][j] = (@tablero[i][j] && ( (flag==2) || (flag==3) )) ? 1 : nil
				tablero[i][j] = ( !@tablero[i][j] && (flag==3) ) ? 1 : nil

			end
		end

		@tablero = tablero.clone

	end

	def game
		while 1 do
			self.printT
			self.gexec
			sleep(1)
		end
	end
	
end