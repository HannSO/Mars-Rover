
class ParserController

def initialize
  @lines = []
  @rovers = []
end

def submit_input(all_input_string)
  lines << all_input_string.split((/\r?\n/)
  plateau_line = lines[0]
  grid_parse(plateau_line)
  rover_lines = lines.delete_at(0)
  rover_parser(rover_lines)
end

def rover_parser(rover_lines)
  line_counter = 0
  rover_lines.each do |line|
    line_counter += 1
    if !(line_counter % 2 == 0)
      one_rover_commands = []
      one_rover_commands << line
      one_rover_parser(one_rover_commands)
    end
  end

  end

end

def one_rover_parser(one_rover_commands)
  rover = Rover.create(grid_object, Orientator.new)




  rovers << rover



def land_rover_parser(one_rover_parser)

end

def
def grid_parser(line)


end


def

def get_landing_position_commands
  landing_commands = array[0]
  raise "Command length incorrect in row one. Submit 3 characters." if landing_commands.length != 3
  raise "Coordinates not in number form . Submit first two values as number" if landing_commands[0,1] != number
  for each convert into

end


private

attr_accessor  :rovers,
