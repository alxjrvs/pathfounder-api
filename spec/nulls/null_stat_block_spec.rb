require 'rails_helper'

describe NullStatBlock do
  before do
    @class = NullStatBlock.new
  end

  describe '.nil?' do
    it 'is true' do
      expect(@class).to be_nil
    end
  end

  describe '.all_stats' do
    it 'returns an empty array' do
      expect(@class.all_stats).to eq []
    end
  end

  StatBlock::STATS.each do |s|
    describe ".#{s}" do
      it 'reports a null stat' do
        expect(@class.send(s).class).to eq NullStat
      end
    end
  end
end
