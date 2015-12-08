require_relative 'pawn'
require_relative 'rook'
require_relative 'queen'
require_relative 'king'
require_relative 'knight'
require_relative 'bishop'

class Board
	@@board = Hash.new()
	@@active_pieces = Hash.new()
	@@base = Hash.new()

	def initialize
		onColor = "w"
		counter = 1
		8.times do |y|
			8.times do |x|
				if(counter == 1)
					@@board[[(x+1),(y+1)]] = "|w|"
					@@base[[(x+1), (y+1)]] = "|w|"
				elsif(counter == -1)
					@@board[[(x+1),(y+1)]] = "|b|"
					@@base[[(x+1), (y+1)]] = "|b|"
				end

				#Piece set-up
				#White pieces
				if(y == 0 || y == 1)
					if(y == 1)
						p = Pawn.new([(x+1),(y+1)], "w")
						@@board[[(x+1),(y+1)]] = p
					elsif(y == 0)
						#Rooks
						if(x == 0 || x == 7)
							p = Rook.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						#Knights
						elsif(x == 1 || x == 6)
							p = Knight.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						#Bishops
						elsif(x == 2 || x == 5)
							p = Bishop.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						#Queen
						elsif(x == 3)
							p = Queen.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						#King
						elsif(x == 4)
							p = King.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						end
					end
				#Black pieces
				elsif(y == 6 || y == 7)
					if(y == 6)
						p = Pawn.new([(x+1),(y+1)], "b")
						@@board[[(x+1),(y+1)]] = p
					elsif(y == 7)
						if(x == 0 || x == 7)
							p = Rook.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						elsif(x == 1 || x == 6)
							p = Knight.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						elsif(x == 2 || x == 5)
							p = Bishop.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						elsif(x == 3)
							p = Queen.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						elsif(x == 4)
							p = King.new([(x+1),(y+1)], "b")
							@@board[[(x+1),(y+1)]] = p
						end
					end
				end

				counter *= -1
				if((x+1) == 8)
					counter *= -1
				end
			end
		end
		#Adds all pieces to active pieces hash
		@@board.each do |loc, piece|
			if(piece != "|w|" && piece != "|b|")
				@@active_pieces[[loc]] = piece
			end
		end
	end

	def Board.remove(location)
		if(@@board[location])
			unless @@board[location] == "|w|" || @@board[location] == "|b|"
				@@board[location] = @@base[location]
				return true
			end
		else
			print("invalid location")
			return false
		end
	end

	def checkmate?(player)
		#Selects the enemy king from the board
		enemy_king = @@board.select {|loc, piece| piece.color != player && piece.is_a?(King)}
		#Returns true if one of the player's pieces can move to the enemy king next turn
		@@active_pieces.each do |loc, piece|
			if(piece.color == player)
				if(piece.valid_move?(piece.location, enemy_king.location) == true)
					return true
				else
					next
				end
			else
				next
			end
		end
	end

	def Board.input(player = "w")
		choice = ""

	end

	def Board.save
		save = File.open("game_save.txt", "w") {}
		@@board.each do |loc, piece|
			save.write(piece.to_s)
		end
	end

	def play
		continue = ""
		save = File.open("game_save.txt", "r")
		until continue.upcase == "Y" || continue.upcase == "N"
			print("Continue from last save?(Y/N): ")
			continue = gets.chomp.to_s
		end
		counter_x = 1
		counter_y = 1
		if(continue.upcase == "Y")
			save.each_line do |line|
				#Skips lines in file that aren't game pieces
				if(line.length > 4)
					next
				end
				#Rebuilds the board from the last save
				@@board[[counter_x, counter_y]] = line
				counter_x += 1
				if(counter_x == 8)
					counter_x == 1
					counter_y += 1
				end		
			end
		end
		Board.show_board(@@board)
	end

	def Board.show_board(table)
		table.each do |loc, piece|
			print(piece.to_s)
			if(loc[0] == 8)
				print("\n")
			end
		end
	end
end

a = Board.new()
a.play