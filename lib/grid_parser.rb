require_relative 'grid'

class GridParser
  attr_reader :grid_klass

  def initialize(all_input_string, grid_klass = Grid)
    @all_input_string = all_input_string
    @grid_klass = grid_klass
  end

  def get_object
    grid_klass.new(coordinate)
  end

  private





  def coordinate
    coordinate = []
    relevent_lines.scan(/\d+/) do |x|
      coordinate << x.to_i
    end
    raise "First line must contain 2 digits and a space. You submitted #{relevent_lines}" unless coordinate.length == 2
     coordinate
  end

  def relevent_lines
    seperate_lines[0]
  end

  def seperate_lines
    @all_input_string.split("\n").to_a
  end


end
