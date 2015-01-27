require 'rails_helper'

describe ModsDsl::Mod do

  describe '.initialize' do
    before do
      @mod = ModsDsl::Mod.new(trait: "strength", modifier: 0, source: nil)
    end

    it "parses string traits to symbols" do
      expect(@mod.trait).to eq :strength
    end
  end
end
