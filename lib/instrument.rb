require_relative 'grid_controller'
require_relative 'rover_controller'
require_relative '../logic/grid'
require_relative '../logic/rover'
require_relative '../logic/orientator'


class Instrument


  def initialize (grid_controller = GridController.new, rover_controller = RoverController.new)
    @grid_controller = grid_controller
    @rover_controller = rover_controller
  end

  def submit_input
    input_lines = []
    loop do
      input_line = gets.chomp
      break if input_line == ""
      input_lines << input_line
    end
    grid_object = grid_controller.create_grid_object(input_lines[0])
    rover_lines = input_lines[1..(input_lines.length-1)]
    print rover_controller.create_rovers_with_commands(rover_lines, grid_object)
    puts "\n"
  end


private
 attr_reader :grid_controller, :rover_controller


end
