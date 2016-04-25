class GridParser


  def initialize(all_input_string)
    @all_input_string = all_input_string

  end

  def coordinate
    coordinate = []
    

    end
  end

  private

  def relevent_lines
    seperate_lines[0]
  end


  def seperate_lines
    @all_input_string.split("\n").to_a
  end

  def remove_spaces(line)
    line.gsub!(" ","")
  end






end
