class RoverParser

  def initialize (all_input_string)
    @all_input_string = all_input_string
  end

  def run_commands_on_rovers()

  end

   private

  def commands_organised_by_rover
    
  end

  def number_rovers
    relevent_lines/2
  end

  def relevent_lines
    seperate_lines[1..seperate_lines.length]
  end

  def seperate_lines
    @all_input_string.split("\n").to_a
  end



end
