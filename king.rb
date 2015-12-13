class King < Piece
	attr_accessor :location, :color, :symbol

	def initialize(location, color)
		@location = location
		@color = color
		if(@color == "w")
			@symbol = "\u2713"
		elsif(@color == "b")
			@symbol = "\u2713"
		end
	end

	def valid_move?(start,finish)
		#if finish location is outside the board return false
	    if(@@valid_choices.has_value?(finish))
	    	return true
		else
			return false
		end
	end

	
	def to_s
		print("|K|")
	end

	def available_moves
	end
end