require 'controller'

describe Controller do
	let(:grid_parser_klass){double("grid_parser_klass")}
	let(:multiple_rovers_parser_klass){double ("multiple_rovers_parser_klass")}
	let(:STDIN){double :STDIN}
	let(:grid){double :grid}
	let(:input){"5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"}
	let(:grid_parser){double ("grid_parser")}
	let(:rovers_parser){double("rovers_parser")}
	subject(:controller){described_class.new(grid_parser_klass, multiple_rovers_parser_klass)}


	before do
		allow(grid_parser_klass).to receive(:new).and_return(grid_parser)
		allow(grid_parser).to receive(:get_object).and_return(grid)
		allow(multiple_rovers_parser_klass).to receive(:new).and_return(rovers_parser)
		allow(rovers_parser).to receive(:initiate_rovers_with_commands)
		allow(rovers_parser).to receive(:formatted_rovers_results).and_return("formatted output")
		allow(STDIN).to receive(:read).and_return(input)
	end

	describe "#initiate rover fleet" do
		it "creates a new grid parser with the full input" do
			expect(grid_parser_klass).to receive(:new).with(input)
			controller.initiate_rover_fleet
		end

		it "calls on the grid_parser to get the object" do
			expect(grid_parser).to receive(:get_object)
			controller.initiate_rover_fleet
		end

		it "creates a multiple_rovers_parser with the full input and the grid, so that rovers can be created with grid" do
			expect(multiple_rovers_parser_klass).to receive(:new).with(input, grid)
			controller.initiate_rover_fleet
		end

		it "calls on the rover parser to instantiate the rovers" do
			expect(rovers_parser).to receive(:initiate_rovers_with_commands)
			controller.initiate_rover_fleet
		end

		it "calls on rover_parser_klass object to print the results" do
			expect(rovers_parser).to receive(:formatted_rovers_results)
			controller.initiate_rover_fleet
		end
	end

end
