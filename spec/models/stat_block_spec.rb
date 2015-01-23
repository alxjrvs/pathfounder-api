require "rails_helper"

describe StatBlock do
  before do
    @stat_block = create :stat_block
  end

  StatBlock::STATS.each do |s|
    describe ".#{s}_mod" do
      it "reports the modifier" do
        expect(@stat_block.send("#{s}_mod")).to_not be_nil
      end
    end
  end

end

