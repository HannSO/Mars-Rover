class GridController


  def create_grid_object(string)
    string.gsub!(/\s+/, "")
    raise "#{string.length} entered.Submit 2 values" unless string.length == 2
    raise "#{string} submitted. Submit only positive integers" unless string !~ /\D/
    Grid.new([string[0].to_i,string[1].to_i])
  end





end
