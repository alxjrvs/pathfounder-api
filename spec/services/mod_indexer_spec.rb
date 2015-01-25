require 'rails_helper'

describe ModIndexer do
  before do
    @mod_1 = ModsDsl::Mod.new({trait: :strength, modifier: +2}, nil)
    @mod_2 = ModsDsl::Mod.new({trait: :acrobatics, modifier: +2}, nil)
    @mod_3 = ModsDsl::Mod.new({trait: :disable_device, modifier: +2}, nil)
    @mod_4 = ModsDsl::Mod.new({trait: :strength, modifier: -1}, nil)
    
    @mods = [@mod_1, @mod_2, @mod_3, @mod_4]
    @indexer = ModIndexer.new @mods
  end
  describe ".total_bonus_for" do
    it "returns the summed bonus of all mods" do
      expect(@indexer.total_bonus_for(:strength)).to eq 1
      expect(@indexer.total_bonus_for(:disable_device)).to eq 2
      expect(@indexer.total_bonus_for(:acrobatics)).to eq 2
    end
  end

  describe "find_by_trait" do
    it 'returns all mods with a given trait' do
      expect(@indexer.find_by_trait(:strength).count).to eq 2

    end
  end
end
