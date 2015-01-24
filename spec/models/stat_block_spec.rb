require "rails_helper"

describe StatBlock do
  before do
    @stat_block = create :stat_block
  end

  StatBlock::STATS.each do |s|
    describe s do
      it "reports the modifier" do
        expect(@stat_block.send(s).class).to eq Stat
      end
    end
  end

end

