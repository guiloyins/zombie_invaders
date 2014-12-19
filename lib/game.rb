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
  WIN_SCREEN = [
                    [' ',' ',' ',' ',' ',' '],
                    [' ','Y','O','U',' ',' '],
                    [' ',' ','W','I','N',' '],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' ']
                  ]
  GAME_OVER_SCREEN = [
                    [' ',' ',' ',' ',' ',' '],
                    [' ','Y','O','U',' ',' '],
                    [' ',' ','L','O','S','E'],
                    [' ',' ',' ',' ',' ',' '],
                    [' ',' ',' ',' ',' ',' ']
                  ]

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
    if win?
      return WIN_SCREEN.collect do |row|
        row.join("")
      end.join("\n")
    elsif lose?
      return GAME_OVER_SCREEN.collect do |row|
        row.join("")
      end.join("\n")
    else
      @game_matriz[HEIGHT][@hero_position] = HERO
      @game_matriz[@fire_row][@fire_col] = FIRE if @fire_col && @fire_row

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
    else
      empty_row = [' ',' ',' ',' ',' ',' ']
      @game_matriz.pop
      @game_matriz.unshift(empty_row)
    end
  end

  def win?
    return false if @zombies.length > 0
    @game_matriz.each do |row|
      return false if row.include?(ZOMBIE)
    end
    true
  end

  def lose?
    dead_line = @game_matriz.last 
    dead_line.include?(ZOMBIE)
  end
end
