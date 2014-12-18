require 'minitest/autorun'
require './lib/hero'

class HeroTest < MiniTest::Unit::TestCase

	def setup
		@hero = Hero.new
	end

	def test_hero_action_move_left
		@hero.action('a')
		assert_equal(28, @hero.position) 
	end

	def test_hero_action_move_right
		@hero.action('d')
		assert_equal(32, @hero.position) 
	end

	def test_hero_action_fire
		assert_equal(:fire, Hero.new.action('l')) 
	end

	def test_hero_cloth
		assert_equal('A', Hero.new.cloth)
	end
end
