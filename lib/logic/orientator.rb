class Orientator
  attr_accessor :bearing

  def initialize(compass_points, spin_commands)
    @compass_points = compass_points
    @spin_commands = spin_commands
  end

  def set_bearing(compass_point)
   @bearing = compass_points[compass_point]
  end

  def turn(spin_command)
    @bearing += spin_commands[spin_command]
    convert_bearing_to_under_one_rotation
  end

  def direction_vector
    [x_direction_value, y_direction_value]
  end

  def read_cardinal_point
    compass_points.key(bearing)
  end

  def read_bearing
    bearing
  end

  private

  attr_reader :spin_commands, :compass_points, :bearing

  def x_direction_value
    (Math.sin(bearing)).round
  end

  def y_direction_value
    (Math.cos(bearing)).round
  end

  def convert_bearing_to_under_one_rotation
    @bearing = @bearing % (Math::PI*2)
  end



end
