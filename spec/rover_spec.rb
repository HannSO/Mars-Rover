require 'rover'

describe Rover do
	subject(:rover){described_class.new}

	describe "#land" do
		it "sets position of rover to the position passed in" do
			rover.land([0,1], :N)
			expect(rover.position).to eq([0,1])
		end
    it "lands the rover with the orientation" do
      rover.land([0,2], :N)
      expect(rover.orientation).to eq(:N)
    end
 	end


end
