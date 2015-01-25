require 'rails_helper'

describe StatCalculator do
  describe "#value" do
    before do
      @stat = create :stat_block
    end
    describe "without a character" do
      it "adds the normalized DB table to the character value" do
        val = StatCalculator.value @stat, :strength
        expect(val).to eq @stat.strength.value
      end
    end
  end
end
