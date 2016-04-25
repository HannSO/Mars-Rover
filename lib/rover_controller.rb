

class RoverController

  COMPASS_POINTS = 	{
    	N: 0,
	    E: Math::PI/2,
	    S: Math::PI,
	    W: Math::PI*3/2
    }

    SPIN_COMMANDS = {
        L: (- Math::PI/2),
        R: Math::PI/2
      }

  def initialize
    @printed_end_positions = ""
  end

  def create_rovers_with_commands(rover_lines, grid_object)
    @grid = grid_object
    commands_organised_by_rover = rover_lines.each_slice(2).to_a
    commands_organised_by_rover.each do |rover_commands|
      execute_rover_commands(rover_commands)
    end
    printed_end_positions
  end

  private

  attr_reader :grid, :printed_end_positions

  def execute_rover_commands(rover_commands)
    land_commands = rover_commands[0].gsub!(" ","")
    move_commands = rover_commands[1]
    rover = Rover.new(grid,Orientator.new(COMPASS_POINTS,SPIN_COMMANDS))
    land_rover(rover,land_commands)
    move_rover(rover,move_commands)
  end

  def land_rover(rover, land_commands)
    raise "Coordinate values must be integers" unless (land_commands[0]!~ /\D/ && land_commands[1]!~ /\D/)
    raise "Compass point must be 'N','W','E' or 'S'" unless ((land_commands[2] =~ /[^NWES]/) == nil) || land_commands[2] == nil
    rover.land([land_commands[0].to_i,land_commands[1].to_i],land_commands[2].to_sym)
  end


  def move_rover(rover, move_commands)
    move_commands.upcase!
    raise "Move commands must be in 'L' 'M' or 'R'" unless (move_commands =~ /[^LMR]/) == nil
    move_commands.each_char do |command|
    case command
      when  "L"
        rover.turn(:L)
      when "R"
        rover.turn(:R)
      when "M"
        rover.move
      end
    end
    save_position(rover)
  end


  def save_position(rover)
    cardinal_point_string = rover.read_cardinal_point.to_s
    coordinate_x_string = rover.read_coordinate[0].to_s
    coordinate_y_string = rover.read_coordinate[1].to_s
    rover_printed_position = [coordinate_x_string, coordinate_y_string, cardinal_point_string].reject(&:empty?).join(' ')
    @printed_end_positions = [printed_end_positions,rover_printed_position].reject(&:empty?).join("\n")
  end




end
