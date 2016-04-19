class Rover


attr_reader :position, :orientation

  def land(coordinate, orientation)
    @position = coordinate
    @orientation = orientation
  end

end
