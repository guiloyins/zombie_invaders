# encoding: utf-8
class Renderer
  require 'io/console'
  
  def initialize(hero)
    @hero = hero
  end

  def clear
    30.times { puts "\n" }
  end
  
  def call
    enemy = '[]'

    @hero_animation = []
    37.times { @hero_animation << " " }
    @hero_animation[@hero.position] = @hero.cloth


    @hero_shot = []
    37.times { @hero_shot << " " }
    @hero_shot[@hero.fire_position] = "'" if @hero.fire_position

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
   ║#{ @hero_shot.join }║
   ║#{ @hero_animation.join }║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }
  end
end
