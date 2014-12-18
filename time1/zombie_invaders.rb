# encoding: utf-8
require 'timeout'

enemy = '[]'
hero = 'A|'

hero_animation = Array.new(36, ' ')
hero_animation[15] = hero
hero_animation = hero_animation.join

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
║#{hero_animation.to_s}║
╚═════════════════════════════════════╝
}

fp = nil
loop do
  begin
    Timeout::timeout(3) { fp = gets }
    puts "---#{fp}---"  # sanity check
    break if (fp)
  rescue Timeout::Error
    # Have no idea
  end
end

# while true
#   puts frame1
#   sleep 0.5
# end
