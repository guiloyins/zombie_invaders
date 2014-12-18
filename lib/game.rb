# encoding: utf-8

require "./hero"
require "./renderer"

class Game
  def initialize
    hero = Hero.new
    renderer = Renderer.new(hero)

    while true
      renderer.clear
      puts renderer.call
      input = STDIN.getch
      puts input

      if input == 'q'
        exit
      end

      hero.action(input)
    end
  end
end
