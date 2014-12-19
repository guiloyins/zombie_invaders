# encoding: utf-8

require "./lib/hero"
require "./lib/renderer"
require "timeout"

class Game
  attr_reader :renderer
  ZOMBIE = "@"
  HERO = "A"
  FIRE = "'"
  START_POSITION = 3
  WIDTH = 5
  HEIGHT = 4
  WIN_SCREEN = ["      ",
                " YOU  ",
                "  WIN ",
                "      ",
                "   A  "]

  HERO_CHAR = "A"

  def initialize
    @pass_count = 0
    @hero_position = START_POSITION
    @fire_row = nil
    @fire_col = nil

    @game_matriz = [
                    [' ',ZOMBIE,' ',ZOMBIE,' ',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' ']
                  ]

    @zombies = [
                    [' ',ZOMBIE,' ',ZOMBIE,' ',' '],
                    [ZOMBIE,' ',' ',' ',' ',ZOMBIE],
                    [' ',ZOMBIE,' ',ZOMBIE,' ',' '],
                    [' ',ZOMBIE,' ',' ',' ',ZOMBIE],
                    [' ',ZOMBIE,ZOMBIE,' ',' ',' ']
                  ]
  end

  def render
    if @zombies.length == 0
      return WIN_SCREEN
    else
      @game_matriz[HEIGHT][@hero_position] = HERO
      @game_matriz[@fire_row][@fire_col] = FIRE if @fire_col && @fire_row
      # @hero_fire[@fire_position] = "'" if @fire_position

      return @game_matriz.collect do |row|
        row.join("")
      end.join("\n")
    end
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
    @pass_count += 1
    if @pass_count % 40 == 0
      add_new_zombies
    end
    if @fire_col && @fire_row
      if @fire_row == 0
        @game_matriz[@fire_row][@fire_col] = ' '
        @fire_row = nil
        @fire_col = nil
      else
        @game_matriz[@fire_row][@fire_col] = ' '
        @fire_row -= 1
        @game_matriz[@fire_row][@fire_col] = FIRE
      end
    end
  end

  def add_new_zombies
    if @zombies.length > 0
      @game_matriz.pop
      @game_matriz.unshift(@zombies.pop)
    end
  end
end
