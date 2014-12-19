# encoding: utf-8

require "./hero"
require "./renderer"
require "timeout"

class Game
  def initialize
    hero = Hero.new
    renderer = Renderer.new(hero)

    while true
      renderer.clear
      puts renderer.call

      begin
        Timeout::timeout(0.1) do
          $input = STDIN.getch
        end

        if $input == 'q'
          exit
        end

        hero.action($input)
      rescue Timeout::Error
        # pass
      end
    end
  end
end
