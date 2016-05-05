require 'rover_parser'

describe RoverParser do
	let(:mock_rover_commands){["1 2 N","LMLMLMLMM"]}
	let(:sequence_no){1}
	let(:rover){double ("rover")}
	let(:grid){double ("grid")}
	subject(:rover_parser){described_class.new(mock_rover_commands, grid, sequence_no, rover)}

	describe "#land_commands" do
		it "should be the command for landing" do
			expect(rover_parser.all_land_data).to eq("1 2 N")
		end
	end

	describe "#move_commands" do
		it "should be the command for landing" do
			rover_parser.all_land_data
			expect(rover_parser.move_commands).to eq("LMLMLMLMM")
		end
	end

	describe "#land_rover" do
		it "calls land method on rover with correct coordinate and navigational point" do

			expect(rover).to receive(:land).with([1,2], :N)
			rover_parser.land_rover
		end
	end

	describe "#run_movement_commands" do
		it "tells the rover to turn left for each L" do
			allow(rover).to receive(:move)
			expect(rover).to receive(:turn).exactly(4).times
			rover_parser.run_movement_commands
		end

		it "tells the rover to turn left for each M" do
			allow(rover).to receive(:turn)
			expect(rover).to receive(:move).exactly(5).times
			rover_parser.run_movement_commands
		end
	end

	describe "#formatted_rover_results" do
		before do
			allow(rover).to receive(:read_x_coordinate).and_return(0)
			allow(rover).to receive(:read_y_coordinate).and_return(1)
			allow(rover).to receive(:read_cardinal_point).and_return(:N)
		end
		it "formats rover position results on one line" do
			expect(rover_parser.formatted_rover_results).to eq("0 1 N")
		end
	end

end
