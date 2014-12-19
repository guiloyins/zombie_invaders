# encoding: utf-8

require "./lib/hero"
require "./lib/renderer"
require "timeout"

class Game
  attr_reader :renderer
  HERO = "A"
  START_POSITION = 3
  WIDTH = 5
  HEIGHT = 4

  HERO_CHAR = "A"

  def initialize
    @hero_position = START_POSITION

    @game_matriz = [
                    [' ','@',' ','@',' ',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' ']
                  ]
  end

  def render
    @game_matriz[HEIGHT][@hero_position] = HERO
    # @hero_fire[@fire_position] = "'" if @fire_position

    return @game_matriz.collect do |row|
      row.join("")
    end.join("\n")
  end

  def left
    if @hero_position > 0
      @game_matriz[HEIGHT][@hero_position] = " "
      @hero_position -= 1
      @game_matriz[HEIGHT][@hero_position] = HERO
    end
  end

  def right
    if @hero_position < WIDTH
      @game_matriz[HEIGHT][@hero_position] = " "
      @hero_position += 1
      @game_matriz[HEIGHT][@hero_position] = HERO
    end
  end

  def fire
    @fire_position = @hero_position
  end

  def pass
  end
end
