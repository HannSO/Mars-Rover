require_relative 'grid_parser'
require_relative 'rover_parser'
require_relative 'grid'
require_relative 'rover'
require_relative 'orientator'


class Instrument

  def initialize (grid_parser_klass = GridParser, rover_parser_klass = RoverParser)
    @grid_parser_klass = grid_parser_klass
    @rover_parser_kilass = rover_parser_klass

  end

  def initiate_rover_fleet(commands_string)
    set_plateau(commands_string)
    set_rovers(commands_string)
  end

  private

  def set_plateau (commands_string)
    grid_parser = grid_parser_klass.new(commands_string)
    @plateau = Grid.new(grid_parser.coordinate)
  end

  def set_rovers(commands_string)
    rover_parser = rover_parser_klass.new(commands_string)
    for |x| in rover_parser.number_rovers do
      rover = Rover.new(new_orientator, plateau)
      execute_rover_commands(rover_parser.commands[x], rover)
    end
  end

  def new_orientator
    Orientator.new(COMPASS_POINTS, SPIN_COMMANDS)
  end

  def execute_commands(commands,rover)
    commands.each do |command|
      rover.command
    end
  end



  attr_reader :plateau


end
