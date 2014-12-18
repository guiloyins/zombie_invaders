# encoding: utf-8
require 'io/console'
enemy = '[]'
hero = 'A'

def clear
  900.times { puts "\n" }
end

hero_animation = []
37.times { hero_animation << " " }

hero_position = 30
hero_animation[hero_position] = hero

while true
  clear
  puts %{
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
