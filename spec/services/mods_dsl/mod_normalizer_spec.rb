require 'rails_helper'

describe ModsDsl::ModNormalizer do
  before do
    @mod1 = {role: :dummy, trait: :will_save, modifier: 0}
    @mod2 = {role: :dummy, trait: :feat_count, modifier: 1}
    @mods = @mod1, @mod2
    @normalizer = ModsDsl::ModNormalizer.new(@mods)
  end

  describe ".normalize" do

    before do
      @normalizer.normalize
    end

    it 'normalizes the mods' do
      expect(Mod.count).to eq @mods.count
      mod1 = Mod.where(role: @mod1[:role], trait: @mod1[:trait], modifier: @mod1[:modifier]).first
      expect(mod1).to_not be_nil
      mod2 = Mod.where(role: @mod2[:role], trait: @mod2[:trait], modifier: @mod2[:modifier]).first
      expect(mod2).to_not be_nil
    end
  end
end
