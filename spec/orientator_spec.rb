require 'orientator'

describe Orientator do
	subject(:orientator){described_class.new(compass_points, spin_commands)}

	let (:compass_points) do
		{
			N: 0,
	    E: Math::PI/2,
	    S: Math::PI,
	    W: Math::PI*3/2
	  }
	end

	let (:spin_commands) do
		{
			L: (- Math::PI/2),
		  R: Math::PI/2
	  }
	end

  describe "#set_bearing" do
    it "returns the bearing of that compass point - North" do
      expect(orientator.set_bearing(:N)).to eq(0)
    end
  end

	describe "#turn" do
		before do
			orientator.set_bearing(:N)
		end
		it "reads from the spin_commands hash, and adds that value to the bearing" do
			expect{orientator.turn(:R)}.to change{orientator.read_bearing}.by(Math::PI/2)
		end
		it "returns a value that corresponds to under one rotation when spun full rotation" do
			expect(orientator.read_bearing).to eq(0)
			4.times{orientator.turn(:R)}
		end
	end

	describe "#read_cardinal_point" do
		before do
			allow(orientator).to receive(:bearing).and_return(0)
		end
		it "returns the corresponding hash key (cardinal-point) of the bearing value" do
			expect(orientator.read_cardinal_point).to eq(:N)
		end
	end

	describe "#direction_vector" do
		before do
			allow(orientator).to receive(:bearing).and_return(0)
		end
		it "calculates a direction vector based on the bearing" do
			expect(orientator.direction_vector).to eq([0,1])
		end
	end
	
end
