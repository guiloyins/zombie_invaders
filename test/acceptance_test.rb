# encoding: utf-8

require 'test/unit'
require "./lib/game"

class AcceptanceTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_initial_game

    assert_screen(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "   A  "])
  end

  def test_move_left
    @game.left

    assert_screen(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "  A   "])
  end

  def test_move_right
    @game.right

    assert_screen(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "    A "])
  end

  def test_move_right_max
    @game.right
    @game.right
    @game.right
    @game.right
    @game.right

    assert_screen(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "     A"])
  end

  def test_move_left_max
    @game.left
    @game.left
    @game.left
    @game.left
    @game.left

    assert_screen(
      [" @ @  ",
       "      ",
       "      ",
       "      ",
       "A     "])
  end

  def test_hero_shoot
    @game.fire
    assert_screen(["@ @   ",
                   "      ",
                   "      ",
                   "   '  ",
                   "   A  "])
    @game.pass
    assert_screen([" @ @  ",
                   "      ",
                   "   '  ",
                   "      ",
                   "   A  "])
    @game.pass
    assert_screen(["  @ @ ",
                   "   '  ",
                   "      ",
                   "      ",
                   "   A  "])
    @game.pass
    assert_screen(["     @",
                   "      ",
                   "      ",
                   "      ",
                   "   A  "])
    @game.pass
    assert_screen(["    @ ",
                   "      ",
                   "      ",
                   "      ",
                   "   A  "])
  end

  def assert_screen(screen)
    assert_equal(screen.join("\n"), @game.render)
  end
end

