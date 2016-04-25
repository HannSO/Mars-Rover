require_relative 'orientator'
require_relative 'grid'

class Rover

ONE_MOVEMENT = 1

  def initialize (grid, orientator)
    @grid = grid
    @orientator = orientator
  end

  def land(new_coordinate, cardinal_point)
    raise "Inputted coordinate is not within grid boundary." if !grid.within_border?(new_coordinate)
    @orientator.set_bearing(cardinal_point)
    @coordinate = new_coordinate
  end

  def move
    tested_coordinate = []
    tested_coordinate[0] = coordinate[0] + (direction_vector[0] * ONE_MOVEMENT)
    tested_coordinate[1] = coordinate[1] + (direction_vector[1] * ONE_MOVEMENT)
    raise "Resultant move position is not within grid boundary." if !grid.within_border?(tested_coordinate)
    execute_move(tested_coordinate)
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

  private

  attr_reader :coordinate, :grid, :orientator

  def execute_move(tested_coordinate)
    @coordinate = tested_coordinate
  end

  def direction_vector
    @orientator.direction_vector
  end
end
