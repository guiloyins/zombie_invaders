# encoding: utf-8
enemy = '[]'
hero = 'A|'

hero_animation = Array(28)
hero_animation[15] = hero

frame1 = %{
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
║             #{hero}                      ║
╚═════════════════════════════════════╝
}

frame2 = %{
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
║              #{hero}                     ║
╚═════════════════════════════════════╝
}

while true
  puts frame1
  sleep 0.5
  puts frame2
  sleep 0.5
end
