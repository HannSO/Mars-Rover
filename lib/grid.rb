class Grid

  def initialize (second_coordinate, first_coordinate = [0,0])
    @first_coordinate = first_coordinate
    @second_coordinate = second_coordinate
  end

  def within_border?(coordinate)
    x_value_within_boundary?(coordinate) && y_value_within_boundary?(coordinate)
  end

  private

  attr_reader :first_coordinate, :second_coordinate

  def x_value_within_boundary?(coordinate)
    !!(coordinate[0].between?(lower_x_boundary, upper_x_boundary))
  end

  def y_value_within_boundary?(coordinate)
      !!(coordinate[1].between?(lower_y_boundary.to_i, upper_y_boundary.to_i))
  end

  def lower_x_boundary
    [first_coordinate[0],second_coordinate[0]].min
  end

  def upper_x_boundary
    [first_coordinate[0],second_coordinate[0]].max
  end

  def lower_y_boundary
    [first_coordinate[1],second_coordinate[1]].min
  end

  def upper_y_boundary
    [first_coordinate[1],second_coordinate[1]].max
  end

end
