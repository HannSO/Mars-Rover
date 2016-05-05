require_relative 'grid_parser'
require_relative 'rover_parser'
require_relative 'multiple_rovers_parser'
require_relative 'grid'
require_relative 'rover'
require_relative 'orientator'


class Controller
  def initialize (grid_parser_klass = GridParser, multiple_rovers_parser_klass = MultipleRoversParser)
    @grid_parser_klass = grid_parser_klass
    @multiple_rovers_parser_klass = multiple_rovers_parser_klass
  end

  def initiate_rover_fleet
    all_input_string = STDIN.read
    set_grid(all_input_string)
    initiate_rovers(all_input_string)
  end

  private

  attr_reader :grid_parser_klass, :multiple_rovers_parser_klass, :grid

  def set_grid_object(all_input_string)
    grid_parser = grid_parser_klass.new(all_input_string)
    @grid = grid_parser.get_object
  end

  def initiate_rovers(all_input_string)
    rovers_parser = multiple_rovers_parser_klass.new(all_input_string, grid)
    rovers_parser.initiate_rovers_with_commands
    STDOUT.puts "Output:\n#{rovers_parser.formatted_rovers_results}"
  end
end
