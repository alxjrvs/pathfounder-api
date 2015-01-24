require 'rails_helper'

describe NullStatBlock do
  before do
    @class = NullStatBlock.new
  end

  it 'is nil' do
    expect(@class).to be_nil
  end

  StatBlock::STATS.each do |s|
    describe ".#{s}" do
      it 'reports a null stat' do
        expect(@class.send(s).class).to eq NullStat
      end
    end
  end
end
