require 'multiple_rovers_parser'

describe MultipleRoversParser do
  let(:rover_parser_klass){double(:rover_parser_klass)}
  let(:grid){double(:grid)}
	subject(:multiple_rovers_parser){described_class.new(all_input_string, grid, rover_parser_klass)}

  let(:all_input_string) {"5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"}

  describe "#get_initiated_rover_objects" do
    context "five line input: four lines of rover input " do
      it "instantiates a new rover_parser to run the commands twice" do
        expect(rover_parser_klass).to receive(:new).twice
        multiple_rovers_parser.get_initiated_rover_objects
      end
    end
  end
end
