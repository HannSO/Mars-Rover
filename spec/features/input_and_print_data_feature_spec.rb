require 'controller.rb'

describe 'inputting data and outputting result' do
    let (:STDIN){double(STDIN)}
    let (:STDOUT){double(STDOUT)}
    let(:STDOUT1){double(STDOUT1)}


  context 'inputting correct data' do
    before do
      allow(STDIN).to receive(:read).and_return("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
    end
    it "returns the correct output" do
      nasa = Controller.new
      expect(STDOUT).to receive(:puts).with("Output:\n1 3 N\n5 1 E")
      nasa.initiate_rover_fleet
    end
  end

  context 'inputting character that does not correspond to rover command' do
    before do
      allow(STDIN).to receive(:read).and_return("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRMa")
    end
    it "notifies the user which character has been ignored, identifying the rover with the typo" do
      nasa = Controller.new
      expect(STDOUT).to receive(:puts).with("Output:\n1 3 N\n5 1 E")
      expect(STDOUT).to receive(:puts).with("'a' is not a function for rover number 2 and has been ignored.")
      nasa.initiate_rover_fleet
    end
  end

  context 'trying to land rover outside of grid boundary' do
    before do
      allow(STDIN).to receive(:read).and_return("5 5\n6 6 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
    end
    it "raises an error notifying the user that the rover cannot be landed outside grid boundary" do
      nasa = Controller.new
      expect{nasa.initiate_rover_fleet}.to raise_error("Inputted coordinate is not within grid boundary.")
    end
  end

  context 'commands move rover off grid boundary' do
    before do
      allow(STDIN).to receive(:read).and_return("5 5\n5 5 N\nM")
    end
    it "raises error preventing this from occuring" do
      nasa = Controller.new
      expect{nasa.initiate_rover_fleet}.to raise_error("Resultant move position is not within grid boundary.")
    end
  end

  context 'improper formatting of grid coordinate' do
    before do
      allow(STDIN).to receive(:read).and_return("55\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
    end
    it "raises error and notifies user" do
      nasa = Controller.new
      expect{nasa.initiate_rover_fleet}.to raise_error("First line must contain 2 digits and a space. You submitted 55")
    end
  end
end
