# encoding: utf-8
enemy = '[]'
hero = 'A'

hero_animation = []
37.times { hero_animation << " " }

hero_position = 30
hero_animation[hero_position] = hero

while true
  puts %{
 ╔═════════════════════════════════════╗
 ║      #{enemy} #{enemy} #{enemy}                       ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║                                     ║
 ║#{ hero_animation.join }║
 ╚═════════════════════════════════════╝
 }
  sleep 0.5
  input = gets.chomp
  if input == 'a' && hero_position > 0
    hero_animation[hero_position] = ' '
    hero_position -= 1
    hero_animation[hero_position] = hero
  end
  if input == 'd' && hero_position < 36
    hero_animation[hero_position] = ' '
    hero_position += 1
    hero_animation[hero_position] = hero
  end
end