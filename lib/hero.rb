# encoding: utf-8

class Hero
	attr_accessor :position

	def initialize
		@position = 30
	end

	def action(key)
		if key == 'd'
			@position += 2 if @position < 36
		elsif	key == 'l'
			:fire
		else
			@position -= 2 if @position > 0
		end
	end

	def cloth
		'A'
	end
end