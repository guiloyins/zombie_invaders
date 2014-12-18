# encoding: utf-8
require './renderer'
class Game

  def clear
    900.times { puts "\n" }
  end

  def initialize
    renderer = Renderer.new
    while true
      clear
      puts renderer.call
      input = STDIN.getch
      puts input
      if input == 'q'
        exit
      end
      if input == 'a' && hero_position > 0
        hero_animation[hero_position] = ' '
        hero_position -= 2
        hero_animation[hero_position] = hero
      end
      if input == 'd' && hero_position < 36
        hero_animation[hero_position] = ' '
        hero_position += 2
        hero_animation[hero_position] = hero
      end
    end
  end

end

Game.new