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
   ║#{ @hero_animation.join }║
   ║_____________________________________║
   ║   A = Left , D = Right, Q = Quit    ║
   ╚═════════════════════════════════════╝
   }
  end
end
