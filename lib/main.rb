# encoding: utf-8
require './lib/game'

class Main

  def clear
    30.times { puts "\n" }
  end

  def run
    @game = Game.new

    while true
      puts clear
      puts @game.render

      begin
        Timeout::timeout(0.1) do
          $input = STDIN.getch
        end

        exit if $input == 'q'
        @game.left  if $input == 'a'
        @game.right if $input == 'd'
        @game.fire  if $input == 'l'

      rescue Timeout::Error
        @game.pass
      end
    end
  end
end

Main.new.run
