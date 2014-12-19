# encoding: utf-8
require './lib/game'

class Main

  def self.run
    @game = Game.new

    while true
      puts @game.render

      begin
        Timeout::timeout(0.1) do
          $input = STDIN.getch
        end

        if $input == 'q'
          exit
        end
        
        if $input == 'a'
          @game.left
        end

        if $input == 'd'
          @game.right
        end

        if $input == 'l'
          @game.fire
        end
      rescue Timeout::Error
        @game.pass
      end
    end
  end
end

Main.run
