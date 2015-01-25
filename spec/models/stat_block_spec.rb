require "rails_helper"

describe StatBlock do
  before do
    @stat_block = create :stat_block
  end

  StatBlock::STATS.each do |s|
    describe s do
      it "returns the stat" do
        expect(@stat_block.send(s).class).to eq Stat
      end
    end
  end

  describe ".all_stats" do
    before do
      @array = @stat_block.all_stats
    end
    it 'contains an array with all the hashes' do
      stat_count = StatBlock::STATS.length
      expect(@array.length).to eq stat_count
    end
  end
end

