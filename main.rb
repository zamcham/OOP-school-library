require_relative 'app'
require_relative 'menu'

class Main
  def initialize
    @app = App.new
    @menu = Menu.new(@app)
  end

  def run
    @app.load_data_from_files
    loop do
      @menu.display
      choice = gets.chomp.to_i

      break unless @menu.process_choice(choice)

      puts "\n"
    end
  end
end

Main.new.run
