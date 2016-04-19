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

  describe "#move" do
    context "rover landed at origin, facing North" do
      before do
        rover.land([0,0], :N)
      end

      it "moves the rover forward one square" do
        rover.move
        expect(rover.position).to eq([0,1])

      end
    end
  end
end
