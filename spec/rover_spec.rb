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

  describe "#turn_left" do
    context "rover landed with bearing PI/2 (East)" do
      before do
        rover.land([0,0], Math::PI/2)
      end
      it "changes bearing by  -PI/2 to equal 0" do
        rover.turn_left
        expect(rover.bearing).to eq(0)
      end

    end
  end

  describe "#move" do
    context "rover landed at origin, facing North" do
      before do
        rover.land([0,0], 0)
      end
      it "moves the rover forward one square" do
        rover.move
        expect(rover.position).to eq([0,1])
      end
    end

    context "rover landed at [1,0], facing West" do
      before do
        rover.land([1,0], (Math::PI*3/2))
      end
      it "moves the rover one movement towards the West(PI)" do
        rover.move
        expect(rover.position).to eq([0,0])
      end
    end

    context "rover landed at [0,0], facing East" do
      before do
        rover.land([0,0], (Math::PI/2))
      end
      it "moves the rover one movement towards the East(2 PI)" do
        rover.move
        expect(rover.position).to eq([1,0])
      end
    end

    context "rover landed at [0,1], facing South" do
      before do
        rover.land([0,1], (Math::PI))
      end
      it "moves the rover one movement towards the East" do
        rover.move
        expect(rover.position).to eq([0,0])
      end
    end
  end
end
