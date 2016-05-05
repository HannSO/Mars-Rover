require 'multiple_rovers_parser'

describe MultipleRoversParser do
  let(:rover_parser_klass){double(:rover_parser_klass)}
  let(:grid){double(:grid)}
  let(:all_input_string) {"5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"}
  let(:rover_parser){double :rover_parser}
  subject(:multiple_rovers_parser){described_class.new(all_input_string, grid, rover_parser_klass)}

  before do
    allow(rover_parser_klass).to receive(:new).and_return(rover_parser)
    allow(rover_parser).to receive(:formatted_rover_results).and_return("one rover's results")
    allow(rover_parser).to receive(:run_commands_on_rovers)
  end

  describe "#initiate_rovers_with_commands" do
    context "five line input: four lines of rover input " do
      it "instantiates a new rover_parser, for each rover, to run the commands twice" do
        expect(rover_parser_klass).to receive(:new).twice
        multiple_rovers_parser.initiate_rovers_with_commands
      end
    end
  end

  describe "#formatted_all_rover_results" do
    before do
      multiple_rovers_parser.initiate_rovers_with_commands
    end
    it "formats rover results on different lines" do
      expect(multiple_rovers_parser.formatted_rovers_results).to eq("one rover's results\none rover's results")
    end
  end
end
