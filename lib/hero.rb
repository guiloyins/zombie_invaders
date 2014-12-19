# encoding: utf-8

class Hero
	attr_accessor :position, :fire_position

	def initialize
		@position = 3
		@fire_position = nil
	end

	def action(key)
		if key == 'd'
			@position += 1 if @position < 6
		elsif	key == 'l'
			@fire_position = @position
		else
			@position -= 1 if @position > 0
		end
	end

	def cloth
		'A'
	end
end