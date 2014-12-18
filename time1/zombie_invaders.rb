# encoding: utf-8

class Game

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


class Renderer
  require 'io/console'
  
  def initialize()
  end

  def clear
    900.times { puts "\n" }
  end
  
  def call
    enemy = '[]'
    hero = 'A'


    hero_animation = []
    37.times { hero_animation << " " }

    hero_position = 30
    hero_animation[hero_position] = hero

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
    
  end
end
