class Knight < Piece
	attr_accessor :location, :color, :symbol

	def initialize(location, color)
		@location = location
		@color = color
	end

	def valid_move?(start,finish)
		return true
	end

	def to_s
		print("|k|")
	end

	def available_moves
	end
end