class Orientator

  def initialize
    @compass_points = {North: Math::PI/2,
      East: Math::PI*2,
      South: Math::PI*3/2,
      West: Math::PI
      }
  end

  def get_bearing(compass_point)
   @compass_points[compass_point]
  end
end
