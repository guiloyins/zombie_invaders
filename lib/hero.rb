# encoding: utf-8

class Hero
	attr_accessor :position, :fire_position

	def initialize
		@position = 30
		@fire_position = nil
	end

	def action(key)
		if key == 'd'
			@position += 2 if @position < 36
		elsif	key == 'l'
			@fire_position = @position
		else
			@position -= 2 if @position > 0
		end
	end

	def cloth
		'A'
	end
end