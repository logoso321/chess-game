class Board
	@@board = Hash.new()

	def initialize
		counter = 1
		8.times do |y|
			8.times do |x|
				if(counter == 1)
					@@board[[(x+1),(y+1)]] = "|w|"
				elsif(counter == -1)
					@@board[[(x+1),(y+1)]] = "|b|"
				end
				counter *= -1
				if((x+1) == 8)
					counter *= -1
				end
			end
		end
	end

	def show_board
		@@board.each do |loc, piece|
			print(piece)
			if(loc[0] == 8)
				print("\n")
			end
		end
	end
end

a = Board.new()
a.show_board