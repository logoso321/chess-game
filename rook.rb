class Rook < Piece
	attr_accessor :location, :color

	def initialize(location, color)
		@location = location
		@color = color
	end

	def valid_move?(start,finish)
		
		return true
	end

	def to_s
		print("|R|")
	end

	def available_moves
	end
end