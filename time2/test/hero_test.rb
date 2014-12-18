require 'minitest/autorun'
require './time2/hero'

class HeroTest < MiniTest::Unit::TestCase

	def test_hero_action_move_left
		assert_equal(:move_left, Hero.new.action('a')) 
	end

	def test_hero_action_move_right
		assert_equal(:move_right, Hero.new.action('d')) 
	end

	def test_hero_action_fire
		assert_equal(:fire, Hero.new.action('l')) 
	end

	def test_hero_cloth
		assert_equal('A', Hero.new.cloth)
	end
end
