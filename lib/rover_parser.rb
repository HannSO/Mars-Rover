require_relative 'rover'
require_relative 'rover_command_constants'

class RoverParser

  def initialize (rover_commands, grid, sequence_no, rover = Rover.new(grid))
    @rover_commands = rover_commands
    @grid = grid
    @sequence_no = sequence_no
    @rover = rover
  end

  def run_commands_on_rovers
    land_rover
    run_movement_commands
  end

  def land_rover
    rover.land(landing_coordinate, landing_cardinal_point)
  end

  def run_movement_commands
    move_commands.split("").each do |command|
      if command == "L"
        rover.turn(:L)
      elsif command == "R"
        rover.turn(:R)
      elsif command == "M"
        rover.move
      else
        STDOUT.puts "'#{command}' is not a function for rover number #{sequence_no} and has been ignored."
      end
    end
  end

  def landing_coordinate
    land_data_trimmed.split("").take(2).map{|x| x.to_i}
  end

  def landing_cardinal_point
    land_data_trimmed[2].to_sym
  end

  def all_land_data
    rover_commands[0]
  end

  def land_data_trimmed
    all_land_data.gsub(" ","")
  end
  def move_commands
    rover_commands[1]
  end

  def formatted_rover_results
    "#{rover.read_x_coordinate} #{rover.read_y_coordinate} #{rover.read_cardinal_point}"
  end

private

attr_reader :sequence_no, :grid, :rover, :rover_commands

end
