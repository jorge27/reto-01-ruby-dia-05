class Game < Tablero
	def initialize
		self.tinit
	end
	
	def gexec(i=0, j=0, tablero = Array.new(@ren){ Array.new(@col) {nil }  }) 
		flag = self.gexec_aux(i,j)
		begin tablero[i][j] = (@tablero[i][j] && ((flag==2) || (flag==3))) ? 1 : nil rescue return end 
		tablero[i][j] = (!@tablero[i][j] && (flag==3)) ? 1 : nil
		i,j = (j<@col) ? i : i+1, (j<@col) ? j+1 : j-@col
		self.gexec(i,j, tablero.clone)
	end

	def game
		self.tprint
		self.gexec
		sleep(1)
		self.game
	end

	private
	def gexec_aux(i,j)
		flag = 0
		flag += self.gexec_aux1(i,j)
		flag += self.gexec_aux2(i,j)
		return flag
	end

	def gexec_aux1(i,j, flag = 0)
		begin flag += @tablero[i-1][j-1] ? 1 : 0 rescue flag=flag end
		begin flag += @tablero[i][j-1] ? 1 : 0 rescue flag=flag end
		begin flag += @tablero[i+1][j-1] ? 1 : 0 rescue flag=flag end
		begin flag += @tablero[i-1][j] ? 1 : 0 rescue flag=flag end
		return flag
	end

	def gexec_aux2(i,j, flag = 0)
		begin flag += @tablero[i+1][j] ? 1 : 0 rescue flag=flag end
		begin flag += @tablero[i-1][j+1] ? 1 : 0 rescue flag=flag end
		begin flag += @tablero[i][j+1] ? 1 : 0 rescue flag=flag end
		begin flag += @tablero[i+1][j+1] ? 1 : 0 rescue flag=flag end
		return flag
	end


	
end