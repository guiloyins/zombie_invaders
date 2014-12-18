# encoding: utf-8

require 'test/unit'
require './lib/renderer'

class RendererTest < Test::Unit::TestCase
  def test_render
    enemy = '[]'
    hero = 'A'
    hero_animation = []
    37.times { hero_animation << " " }

    hero_position = 30
    hero_animation[hero_position] = hero

    render = Renderer.new.call
    render_spected = 
%{
   ╔═════════════════════════════════════╗
   ║                                     ║
   ║  * * *    Zombie Invaders    * * *  ║
   ║                                     ║
   ║═════════════════════════════════════║
   ║      #{enemy} #{enemy} #{enemy}                       ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║                                     ║
   ║#{ hero_animation.join }║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }

    assert_equal(render_spected,render)
  end
end

