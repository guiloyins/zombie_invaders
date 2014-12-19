# encoding: utf-8

require 'test/unit'
require "./lib/game"

class AcceptanceTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_initial_game

    screen(
      " @ @  ",
      "      ",
      "      ",
      "      ",
      "   A  ")
  end

  def test_move_left
    left

    screen(
      " @ @  ",
       "      ",
       "      ",
       "      ",
       "  A   ")
  end

  def test_move_right
    right

    screen(
      " @ @  ",
       "      ",
       "      ",
       "      ",
       "    A ")
  end

  def test_move_right_max
    right(5)

    screen(
      " @ @  ",
       "      ",
       "      ",
       "      ",
       "     A")
  end

  def test_move_left_max
    left(5)

    screen(
      " @ @  ",
       "      ",
       "      ",
       "      ",
       "A     ")
  end

  def test_hero_shoot
    fire
    screen("@ @   ",
                   "      ",
                   "      ",
                   "   '  ",
                   "   A  ")
    pass
    screen(" @ @  ",
                   "      ",
                   "   '  ",
                   "      ",
                   "   A  ")
    pass
    screen("  @ @ ",
                   "   '  ",
                   "      ",
                   "      ",
                   "   A  ")
    pass
    screen("     @",
                   "      ",
                   "      ",
                   "      ",
                   "   A  ")
    pass
    screen("    @ ",
                   "      ",
                   "      ",
                   "      ",
                   "   A  ")
  end

  def test_game_over
    fire
    pass(4)
    screen("    @ ",
                   "      ",
                   "      ",
                   "      ",
                   "   A  ")
  end

  def left(count = 1)
    count.times { @game.left }
  end

  def right(count = 1)
    count.times { @game.right }
  end

  def fire
    @game.fire
  end

  def pass(count = 1)
    count.times { @game.pass }
  end

  def screen(*lines)
    assert_equal(lines.join("\n"), @game.render)
  end
end

