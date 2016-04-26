require_relative 'rover_parser'

class MultipleRoversParser

  NUMBER_LINES_PER_ROVER = 2

  def initialize(all_input_string, grid, rover_parser_klass = RoverParser)
    @all_input_string = all_input_string
    @grid = grid
    @rover_parser_klass = rover_parser_klass
  end

  def get_initiated_rover_objects
    p number_rovers
    number_rovers.times do |x|
      @rover_parser_klass.new
    end
  end


    # def initialize (all_input_string, grid, rover_parser_klass = RoverParser)
  #   @all_input_string = all_input_string
  #   @grid = grid
  #   @rover_results = []
  # end
  #
  # def run_commands_on_rovers
  #   for number_rovers do |x|
  #     parser = RoverParser.new(commands_organised_by_rover[x-1])
  #     @rover_results << parser.print_result
  #   end
  # end
  #
  # # def print_results
  # #
  # # end
  #
  #  private
  #
  #  attr_reader :grid
  def commands_organised_by_rover
    relevent_lines.each_slice(NUMBER_LINES_PER_ROVER).to_a
  end

  def number_rovers
    commands_organised_by_rover.count
  end

  def relevent_lines
    seperate_lines[1..seperate_lines.length]
  end
  #
  def seperate_lines
    @all_input_string.split("\n").to_a
  end

end
