require 'grid_parser'


describe GridParser do
	subject(:grid_parser){described_class.new(all_input_string)}
  let(:all_input_string) do
    "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
  end

  it "sets the coordinate to be an an array of the first line, without spaces" do
    expect(grid_parser.get_coordinate).to eq([5,5])
  end








end
