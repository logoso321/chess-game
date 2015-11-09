class Piece
	attr_accessor :location, :color

	def intitialize(location = [0,0], color)
		@location = location
		@color = color
	end

	def can_promote?
		if(@location[1] == 7)
			return true
		else return false
		end
	end

	def team
		return @color
	end
end