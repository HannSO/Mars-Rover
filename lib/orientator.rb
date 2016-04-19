class Orientator

  def initialize
    @compass_points = {North: 0,
      East: Math::PI/2,
      South: Math::PI,
      West: Math::PI*3/2
      }
  end

  def get_bearing(compass_point)
   @compass_points[compass_point]
  end


end
