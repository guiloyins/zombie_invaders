# encoding: utf-8

require 'test/unit'
require "./lib/game"

class AcceptanceTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_initial_game

    assert_equal(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "   A  "].join("\n"), @game.render)
  end

  def test_move_left
    @game.action('a')

    assert_equal(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "  A   "].join("\n"), @game.render)
  end

  def test_move_right
    @game.action('d')

    assert_equal(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "    A "].join("\n"), @game.render)
  end

  def test_move_right_max
    @game.action('d')
    @game.action('d')
    @game.action('d')
    @game.action('d')
    @game.action('d')

    assert_equal(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "     A"].join("\n"), @game.render)
  end

  def test_hero_shoot
    @game.action('l')
    
    assert_equal(
      [" @ @  ",
       "      ",
       "      ",
       "   '  ",
       "   A  "].join("\n"), @game.render)
  end
end

