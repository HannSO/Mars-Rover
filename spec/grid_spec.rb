require 'grid'

describe Grid do
	subject(:grid){described_class.new([3,3])}

  it "returns true when value is within border" do
    expect(grid.within_border?([2,2])).to eq(true)
  end
	
  it "returns false when value is outside of border" do
    expect(grid.within_border?([3,4])).to eq(false)
  end
end
