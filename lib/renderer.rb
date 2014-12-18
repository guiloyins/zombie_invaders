# encoding: utf-8
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
