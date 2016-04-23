require_relative 'orientator'
require_relative 'grid'

class Rover

ONE_MOVEMENT = 1

  def initialize (grid, orientator)
    @grid = grid
    @orientator = orientator
  end

  def land(new_coordinate, cardinal_point)
    raise "Coordinate is not within grid boundary." if !grid.within_border?(new_coordinate)
    @orientator.set_bearing(cardinal_point)
    @coordinate = new_coordinate
  end

  def move
    direction_vector = @orientator.direction_vector
    tested_coordinate = []
    tested_coordinate[0] = coordinate[0] + (direction_vector[0] * ONE_MOVEMENT)
    tested_coordinate[1] = coordinate[1] + (direction_vector[1] * ONE_MOVEMENT)
    raise "Point is not within grid boundary." if !grid.within_border?(test_coordinate)
    execute_move(tested_coordinate)
  end


  def turn(spin_command)
   orientator.turn(spin_command)
  end

  def get_cardinal_point
    orientator.read_cardinal_point
  end

  def read_coordinate
    coordinate
  end

  private

  attr_reader :coordinate, :grid

  def execute_move(tested_coordinate)
    coordinate = tested_coordinate
  end
end
