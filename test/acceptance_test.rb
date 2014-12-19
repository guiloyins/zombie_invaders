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
       "   A  "].join('\n'), @game.render)
  end
end

