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
    screen(" @ @  ",
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
    screen(" @ @  ",
           "   '  ",
           "      ",
           "      ",
           "   A  ")
    pass
    screen(" @ '  ",
           "      ",
           "      ",
           "      ",
           "   A  ")
    pass
  end

  def test_enemy_movement
    screen(" @ @  ",
           "      ",
           "      ",
           "      ",
           "   A  ")
    pass(40)
    screen(" @@   ",
           " @ @  ",
           "      ",
           "      ",
           "   A  ")
    pass(40)
    screen(" @   @",
           " @@   ",
           " @ @  ",
           "      ",
           "   A  ")
    pass(40)
    screen(" @ @  ",
           " @   @",
           " @@   ",
           " @ @  ",
           "   A  ")
  end


  def test_win_game
    left(2)
    pass(120)
    6.times { 
      fire
      pass(5)
      right }
    pass(80)
    6.times { 
      fire
      pass(5)
      left }
    screen("      ",
           " YOU  ",
           "  WIN ",
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

