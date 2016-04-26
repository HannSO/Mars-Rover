require 'grid_parser'


describe GridParser do
	let(:grid_klass){double :grid_klass}
	subject(:grid_parser){described_class.new(all_input_string, grid_klass)}


	context "correctly formatted input." do
		before do
			allow(grid_klass).to receive(:new).with([5,5]).and_return(true)
		end

	  let(:all_input_string) do
	    "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
	  end

	  it "creates a grid object, initialized with coordinates as array of the first line digits" do
			expect(grid_klass).to receive(:new).with([5,5])
			grid_parser.get_object
	  end
	end

	context "poorly formatted input:four numbers." do
		let(:all_input_string) do
			"5 5 6 7\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
		end
		it "raises an error if two numbers are not submitted into line" do
			expect{grid_parser.get_object}.to raise_error("First line must contain 2 digits and a space. You submitted 5 5 6 7")
		end
	end

end
