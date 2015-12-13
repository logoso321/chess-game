class Piece
	attr_accessor :location, :color, :symbol, :valid_choices
	#All legal moves
	@@valid_choices = {"A1" => [1,8], "A2" => [1,7], "A3" => [1,6], "A4" => [1,5] , "A5" => [1,4], "A6" => [1,3], "A7" => [1,2], "A8" => [1,1],
						"B1" => [2,8], "B2" => [2,7], "B3" => [2,6], "B4" => [2,5], "B5" => [2,4], "B6" => [2,3], "B7" => [2,2], "B8" => [2,1],
						"C1" => [3,8], "C2" => [3,7], "C3" => [3,6], "C4" => [3,5], "C5" => [3,4], "C6" => [3,3], "C7" => [3,2], "C8" => [3,1],
						"D1" => [4,8], "D2" => [4,7], "D3" => [4,6], "D4" => [4,5], "D5" => [4,4], "D6" => [4,3], "D7" => [4,2], "D8" => [4,1],
						"E1" => [5,8], "E2" => [5,7], "E3" => [5,6], "E4" => [5,5], "E5" => [5,4], "E6" => [5,3], "E7" => [5,2], "E8" => [5,1],
						"F1" => [6,8], "F2" => [6,7], "F3" => [6,6], "F4" => [6,5], "F5" => [6,4], "F6" => [6,3], "F7" => [6,2], "F8" => [6,1],
						"G1" => [7,8], "G2" => [7,7], "G3" => [7,6], "G4" => [7,5], "G5" => [7,4], "G6" => [7,3], "G7" => [7,2], "G8" => [7,1],
						"H1" => [8,8], "H2" => [8,7], "H3" => [8,6], "H4" => [8,5], "H5" => [8,4], "H6" => [8,3], "H7" => [8,2], "H8" => [8,1]}

	def intitialize(location = [1,1], color = "b")
		@location = location
		@color = color
	end

	def can_promote?
		if(@location[1] == 7)
			return true
		else return false
		end
	end

	def valid_move?(start, finish)
		#Returns false if the location of finish is outside of bounds
	end

	def valid_choices
		return @@valid_choices
	end

	def team
		return @color
	end
end