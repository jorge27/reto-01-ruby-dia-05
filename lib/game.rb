class Game < Tablero
	def initialize
		self.tinit
	end

	def gexec(i=0,j=0, tablero = Array.new(@ren) {Array.new(@col) {nil}})
		begin
			i += (j<@col) ? 0 : 1
			j += (j<@col) ? 1 : -@col
			tablero = gexec_aux(i,j, tablero.clone)
			gexec(i,j, tablero.clone)
		rescue
			0
		end
	end

	def game
		print "game"
		self.tprint
		self.gexec
		sleep(1)
		self.game
	end

	
	private
	def gexec_aux(i,j,tablero)
		flag = 0
		begin
			flag += @tablero[i-1][j-1] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i][j-1] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i+1][j-1] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i-1][j] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i+1][j] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i-1][j+1] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i][j+1] ? 1 : 0
		rescue
		end
		begin
			flag += @tablero[i+1][j+1] ? 1 : 0
		rescue
		end

		tablero[i][j] = (@tablero[i][j] && ((flag==2 || flag==3))) ? 1 : nil
		tablero[i][j] = (!@tablero[i][j] && (flag==3) ) ? 1 : nil

		return tablero.clone
	end
end