require 'orientator'

describe Orientator do
	subject(:orientator){described_class.new}

  describe "#get_bearing" do
    it "returns the bearing of that compass point - North" do
      expect(orientator.get_bearing(:North)).to eq(0)
    end
  end

end
