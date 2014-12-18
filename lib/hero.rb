# encoding: utf-8

class Hero
	def action(key)
		if key == 'd'
			:move_right
		elsif	key == 'l'
			:fire
		else
			:move_left
		end
	end

	def cloth
		'A'
	end
end