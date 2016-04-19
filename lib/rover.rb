class Rover


attr_reader :position, :bearing

ONE_MOVEMENT = 1

  def land(coordinate, bearing)
    @position = coordinate
    @bearing = bearing
  end

  def move
    @position[0] += (Math.cos(@bearing)).round * ONE_MOVEMENT
    @position[1] += (Math.sin(@bearing)).round * ONE_MOVEMENT
  end



end
