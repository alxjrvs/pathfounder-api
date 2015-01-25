require 'rails_helper'

describe Stat do
  before do
    @stat = Stat.new :strength, 12
  end
  describe 'modifier' do
    it " calculates the mod " do
      expect(@stat.modifier).to eq 1

    end
  end
end
