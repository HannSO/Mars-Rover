require_relative 'orientator'
require_relative 'grid'
require_relative 'rover_command_constants'

class Rover

ONE_MOVEMENT = 1

  def initialize (grid, orientator = Orientator.new(COMPASS_POINTS, SPIN_COMMANDS))
    @grid = grid
    @orientator = orientator
  end

  def land(new_coordinate, cardinal_point)
    raise "Inputted coordinate is not within grid boundary." if !grid.within_border?(new_coordinate)
    @orientator.set_bearing(cardinal_point)
    @coordinate = new_coordinate
  end

  def move
    raise "Resultant move position is not within grid boundary." if !grid.within_border?(test_coordinate)
    execute_move(test_coordinate)
  end

  def turn(spin_command)
   orientator.turn(spin_command)
  end

  def read_cardinal_point
    orientator.read_cardinal_point
  end

  def read_coordinate
    coordinate
  end

  def read_x_coordinate
    coordinate[0]
  end

  def read_y_coordinate
    coordinate[1]
  end

  private

  attr_reader :coordinate, :grid, :orientator

  def test_coordinate
    test_coordinate = []
    test_coordinate[0] = coordinate[0] + new_x_movement
    test_coordinate[1] = coordinate[1] + new_y_movement
    test_coordinate
  end

  def new_x_movement
    (direction_vector[0] * ONE_MOVEMENT)
  end

  def new_y_movement
    (direction_vector[1] * ONE_MOVEMENT)
  end

  def execute_move(tested_coordinate)
    @coordinate = tested_coordinate
  end

  def direction_vector
    @orientator.direction_vector
  end
end
