# encoding: utf-8

require "./hero"
require "./renderer"
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
    @renderer.call
  end

  def action(key)
    @hero.action(key)
  end
end
