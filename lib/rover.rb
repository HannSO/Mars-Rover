class Rover


attr_reader :position, :orientation

  def land(coordinate, orientation)
    @position = coordinate
    @orientation = orientation
  end

  def move
    @position[1] += 1
  end


end
