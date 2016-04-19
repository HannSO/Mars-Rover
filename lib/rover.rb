class Rover


attr_reader :position, :bearing

  def land(coordinate, bearing)
    @position = coordinate
    @bearing = bearing
  end

  def move
    @position[1] += 1
  end


end
