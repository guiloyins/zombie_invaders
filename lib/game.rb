# encoding: utf-8

require "./lib/hero"
require "./lib/renderer"
require "timeout"

class Game
  attr_reader :renderer

  HERO_CHAR = "A"

  def initialize
    @renderer = Renderer.new(@hero)
    @hero_animation, @hero_fire = [], []
    @fire_position = nil
    @hero_position = 3
    6.times do
      @hero_animation << " "
      @hero_fire << " "
    end
    @hero_animation[@hero_position] = HERO_CHAR
  end

  def render
    @hero_animation = []
    6.times { @hero_animation << " " }

    @hero_animation[@hero_position] = HERO_CHAR
    @hero_fire[@fire_position] = "'" if @fire_position

    @renderer.clear

    [" @ @  ",
     "      ",
     "      ",
     "#{ @hero_fire.join }",
     "#{ @hero_animation.join }"].join("\n")
  end

  def left
    @hero_position -= 1 if @hero_position > 0
  end

  def right
    @hero_position += 1 if @hero_position < 5
  end

  def fire
    @fire_position = @hero_position
  end

  def pass
  end

end
