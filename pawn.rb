require_relative 'piece'

class Pawn < Piece
	attr_accessor :location, :color, :symbol
	
	def initialize(location, color)
		@location = location
		@color = color
	end

	def valid_move?(start,finish)
		return true
	end

	def to_s
		print("|P|")
	end

	def can_promote?
		if(@location[1] == 8 || location[1] == 1)
			return true
		else return false
		end
	end

	def available_moves
	end
end