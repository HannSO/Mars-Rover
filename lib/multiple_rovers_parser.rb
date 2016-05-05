require_relative 'rover_parser'


class MultipleRoversParser

  NUMBER_LINES_PER_ROVER = 2

  def initialize(all_input_string, grid, rover_parser_klass = RoverParser)
    @all_input_string = all_input_string
    @grid = grid
    @rover_parser_klass = rover_parser_klass
    @rover_results = []
  end

  def initiate_rovers_with_commands
    number_rovers.times {|x| initiate_rover_parser_with_commands(x)}
  end

  def formatted_rovers_results
    @rover_results.join("\n")
  end

  private

  attr_reader :grid

  def initiate_rover_parser_with_commands(index_no)
    rover_parser = @rover_parser_klass.new(commands_by_rover[index_no], grid, (index_no+1))
    rover_parser.run_commands_on_rovers
    save_rover_results(rover_parser)
  end

  def save_rover_results(rover_parser)
    @rover_results << rover_parser.formatted_rover_results
  end

  def commands_by_rover
    relevent_lines.each_slice(NUMBER_LINES_PER_ROVER).to_a
  end

  def number_rovers
    commands_by_rover.count
  end

  def relevent_lines
    seperate_lines[1..seperate_lines.length]
  end

  def seperate_lines
    @all_input_string.split("\n").to_a
  end

end
