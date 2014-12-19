# encoding: utf-8

require "./lib/hero"
require "./lib/renderer"
require "timeout"

class Game
  attr_reader :renderer

  def initialize
    @renderer = Renderer.new(@hero)
    @hero_animation, @hero_fire = [], []
    @fire_position = nil
    @hero_position = 3
    @hero_char = "A"
    6.times do
      @hero_animation << " "
      @hero_fire << " "
    end
    @hero_animation[@hero_position] = @hero_char
  end

  # def call
#     enemy = '[]'
#
#     @hero_animation = []
#     37.times { @hero_animation << " " }
#     @hero_animation[@hero.position] = @hero.cloth
#
#
#     @hero_shot = []
#     37.times { @hero_shot << " " }
#     @hero_shot[@hero.fire_position] = "'" if @hero.fire_position
#
#    %{
#    ╔═════════════════════════════════════╗
#    ║                                     ║
#    ║  * * *    Zombie Invaders    * * *  ║
#    ║                                     ║
#    ║═════════════════════════════════════║
#    ║      #{enemy} #{enemy} #{enemy}                       ║
#    ║                                     ║
#    ║                                     ║
#    ║                                     ║
#    ║                                     ║
#    ║                                     ║
#    ║                                     ║
#    ║#{ @hero_shot.join }║
#    ║#{ @hero_animation.join }║
#    ║_____________________________________║
#    ║   A = Left , D = Right, Q = Quit    ║
#    ╚═════════════════════════════════════╝
#    }
#   end


  def render
    @hero_animation = []
    6.times { @hero_animation << " " }

    @hero_animation[@hero_position] = @hero_char
    @hero_fire[@fire_position] = "'" if @fire_position

    @renderer.clear

    [" @ @  ",
     "      ",
     "      ",
     "#{ @hero_fire.join }",
     "#{ @hero_animation.join }"].join("\n")
  end

  def left
    @hero_position -= 1
  end

  def right
    @hero_position += 1 if @hero_position < 5
  end

  def fire
    @fire_position = @hero_position
  end

  def pass
    render
  end

end
