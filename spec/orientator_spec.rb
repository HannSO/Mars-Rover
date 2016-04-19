require 'orientator'

describe Orientator do
	subject(:orientator){described_class.new}
  # let(:North){double("North")}


  describe "#get_bearing" do
    it "returns the bearing of that compass point - North" do
      expect(orientator.get_bearing(:North)).to eq(Math::PI/2)
    end
  end

end
