# encoding: utf-8

require "./lib/hero"
require "./lib/renderer"
require "timeout"

class Game
  attr_reader :renderer

  def initialize
    @hero = Hero.new
    @renderer = Renderer.new(@hero)
  end

  def clear_screen
    @renderer.clear
  end

  def render
    [" @ @  ",
     "      ",
     "      ",
     "      ",
     "   A  "].join("\n")
  end

  def action(key)
    @hero.action(key)
  end

  def left
  end

  def right
  end

  def fire
  end

  def pass
  end

end
