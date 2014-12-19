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

    assert_equal(render_spected, render)
  end

  def test_move_left
    @hero.action('a')
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
   ║                            A        ║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }

    assert_equal(render_spected, render)
  end

  def test_move_right
    @hero.action('d')
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
   ║                                A    ║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }

    assert_equal(render_spected, render)
  end

  def test_move_right_max
    @hero.action('d')
    @hero.action('d')
    @hero.action('d')
    @hero.action('d')
    @hero.action('d')
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
   ║                                    A║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }

    assert_equal(render_spected, render)
  end

  def test_hero_shoot
    @hero.action('l')
    render = Renderer.new(@hero).call
    render_spected = 
%{
   ║                              '      ║
   ║                              A      ║
   }

    assert_equal(true, render.include?(render_spected)) 
  end
end

