require 'grid_parser'


describe GridParser do
	subject(:grid_parser){described_class.new(all_input_string)}

	context "correctly formatted input." do
	  let(:all_input_string) do
	    "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
	  end
	  it "sets the coordinate to be an an array of the first line, without spaces" do
	    expect(grid_parser.coordinate).to eq([5,5])
	  end
	end


	context "poorly formatted input:four numbers." do
		let(:all_input_string) do
			"5 5 6 7\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
		end
		it "raises an error if two numbers are not submitted into line" do
			expect{grid_parser.coordinate}.to raise_error("First line must contain 2 digits and a space. You submitted 5 5 6 7")
		end
	end

end
