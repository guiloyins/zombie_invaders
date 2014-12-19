# encoding: utf-8

require "./lib/hero"
require "./lib/renderer"
require "timeout"

class Game
  attr_reader :renderer
  HERO = "A"
  FIRE = "'"
  START_POSITION = 3
  WIDTH = 5
  HEIGHT = 4

  HERO_CHAR = "A"

  def initialize
    @hero_position = START_POSITION
    @fire_row = nil
    @fire_col = nil

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
    @game_matriz[@fire_row][@fire_col] = FIRE if @fire_col && @fire_row
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
    unless @fire_col
      @fire_col = @hero_position
      @fire_row = HEIGHT - 1
    end
  end

  def pass
    if @fire_col && @fire_row
      if @fire_row == 0
        @fire_row = nil
        @fire_col = nil
      else
        @game_matriz[@fire_row][@fire_col] = ' '
        @fire_row -= 1
        @game_matriz[@fire_row][@fire_col] = FIRE
      end
    end
  end
end
