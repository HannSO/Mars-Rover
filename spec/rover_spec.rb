require 'rover.rb'

describe Rover do
	subject(:rover){described_class.new(grid,orientator)}
	 let(:grid){double (:grid)}
	 let(:orientator){double(:orientator)}
	 before do
	 	allow(orientator).to receive(:set_bearing).with(:cardinal_point)
		allow(orientator).to receive(:read_cardinal_point)
		allow(orientator).to receive(:turn).with(:command)
 	end


	describe "#land" do
		it "raises error when you try and land plane out of grid boundary" do
			 allow(grid).to receive(:within_border?).with([3,3]).and_return(false)
			 expect{rover.land([3,3],:N)}.to raise_error("Inputted coordinate is not within grid boundary.")
			 expect(rover.read_coordinate).to eq(nil)
		end

		it "sets coordinate passed in as Rover coordinate, when within border" do
			allow(grid).to receive(:within_border?).with([3,3]).and_return(true)
			allow(orientator).to receive(:set_bearing).with(:cardinal_point)
			expect{rover.land([3,3],:cardinal_point)}.to change{rover.read_coordinate}.to([3,3])
		end
	end

	describe "#move" do
		context "landed on position [0,0] ,facing cardinal_point (north))" do
			before do
				allow(grid).to receive(:within_border?).with([0,0]).and_return(true)
				rover.land([0,0],:cardinal_point)
				allow(orientator).to receive(:direction_vector).and_return([0,1])
			end

			it "raises error, and does not execute move, if resultant move is off boundary" do
				allow(grid).to receive(:within_border?).with([0,1]).and_return(false)
				expect{rover.move}.to raise_error("Resultant move position is not within grid boundary.")
				expect(rover.read_coordinate).to eq([0,0])
			end
		end
	end

	describe "#turn" do
		it "calls on the orientator to turn with the command passed in as argument" do
			expect(orientator).to receive(:turn).with(:command)
			rover.turn(:command)
		end
	end

	describe "#get_cardinal_point" do
		it "calls on the orientator to read_cardinal_point" do
			expect(orientator).to receive(:read_cardinal_point)
			rover.read_cardinal_point
		end
	end

end
