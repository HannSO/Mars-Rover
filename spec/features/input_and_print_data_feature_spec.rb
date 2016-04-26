require 'stringio'
require 'controller'

describe Controller do
	subject(:controller){described_class.new}

  describe 'inputting data and printing rover positions' do
    context 'Correctly formatted data inputted' do
      before do
          # allow(STDIN).to receive(:gets) { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"}
        controller.stub(:gets) {"5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n\n"+""}
      end



      it "should return positions of two rovers" do
      expect(controller.submit_input).to eq("1 3 N\n5 1 E")
      end
    end
  end
end


#
# require 'stringio'
#
# def capture_name
#   $stdin.gets.chomp
# end
#
# describe 'capture_name' do
#   before do
#     $stdin = StringIO.new("James T. Kirk\n")
#   end
#
#   after do
#     $stdin = STDIN
#   end
#
#   it "should be 'James T. Kirk'" do
#     expect(capture_name).to be == 'James T. Kirk'
#   end
# end
