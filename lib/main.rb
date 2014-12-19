# encoding: utf-8
require './lib/game'

class Main

  def self.run
    @game = Game.new

    while true
      @game.clear_screen
      puts @game.render

      begin
        Timeout::timeout(0.1) do
          $input = STDIN.getch
        end

        if $input == 'q'
          exit
        end

        @game.action($input)
      rescue Timeout::Error
        # pass
      end
    end
  end
end

Main.run
