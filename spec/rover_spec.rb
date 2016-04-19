require 'rover'

describe Rover do
	subject(:rover){described_class.new}

	describe "#land" do
		it "sets position of rover to the position passed in" do
			rover.land([0,1], :orientation)
			expect(rover.position).to eq([0,1])
		end
    it "lands the rover and sets bearing to the bearing passed in" do
      rover.land([0,2], :bearing)
      expect(rover.bearing).to eq(:bearing)
    end
 	end

  describe "#move" do
    context "rover landed at origin, facing North" do
      before do
        rover.land([0,0], (Math::PI/2))
      end
      it "moves the rover forward one square" do
        rover.move
        expect(rover.position).to eq([0,1])
      end
    end
  end
end
