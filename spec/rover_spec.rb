require 'rover'

describe Rover do
	subject(:rover){described_class.new(grid,orientator)}
	 let(:grid){double (:grid)}
	 let(:orientator){double(:orientator)}


	describe "#land" do
		it "raises error when you try and land plane out of grid boundary" do
			 allow(grid).to receive(:within_border?).with([3,3]).and_return(false)
			 expect{rover.land([3,3],:N)}.to raise_error("Coordinate is not within grid boundary.")
			 expect(rover.read_coordinate).to eq(nil)
		end

		it "sets coordinate passed in as Rover coordinate, when within border" do
			allow(grid).to receive(:within_border?).with([3,3]).and_return(true)
			allow(orientator).to receive(:set_bearing).with(:cardinal_point)
			expect{rover.land([3,3],:cardinal_point)}.to change{rover.read_coordinate}.to([3,3])
		end

		it "tells the orientator to set bearing with cardinal_point passed in" do
			expect(orientator).to receive(:set_bearing).with(:cardinal_point)
		end

	end







end
