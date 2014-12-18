# encoding: utf-8

require 'test/unit'
require './lib/renderer'
require './lib/hero'

class RendererTest < Test::Unit::TestCase
  def setup
    @hero = Hero.new
  end

  def test_initial_game
    render = Renderer.new(@hero).call
    render_spected = 
%{
   ╔═════════════════════════════════════╗
   ║                                     ║
   ║  * * *    Zombie Invaders    * * *  ║
   ║                                     ║
   ║═════════════════════════════════════║
   ║      [] [] []                       ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                              A      ║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }

    assert_equal(render_spected,render)
  end
end

