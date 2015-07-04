require 'rails_helper'

describe StatCalculator do
  let(:stat_block) { create :stat_block }
  let(:stat_calculator) { StatCalculator.new(stat_block: stat_block, mods: ModIndexer.new([])) }

  StatCalculator::STATS.each do |stat|
    describe ".#{stat}" do
      it "returns a Stat object" do
        expect(stat_calculator.send(stat)).to be_a Stat
      end
    end
  end

end
