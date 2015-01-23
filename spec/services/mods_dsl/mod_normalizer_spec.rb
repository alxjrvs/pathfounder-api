require 'rails_helper'

describe ModsDsl::ModNormalizer do
  before do
    @alt_source = create :fighter
    @mod1 = {role: :dummy, trait: :will_save, modifier: 0}
    @mod2 = {role: :dummy, trait: :feat_count, modifier: 1, source: @alt_source}
    @mods = @mod1, @mod2
    @source = create :fighter
    @normalizer = ModsDsl::ModNormalizer.new(@mods, source: @source)
  end

  describe ".normalize" do

    before do
      @normalizer.normalize
    end

    it 'normalizes the mods' do
      expect(Mod.count).to eq @mods.count
      mod1 = Mod.where(role: @mod1[:role], trait: @mod1[:trait], modifier: @mod1[:modifier], source: @source).first
      expect(mod1).to_not be_nil
      mod2 = Mod.where(role: @mod2[:role], trait: @mod2[:trait], modifier: @mod2[:modifier], source: @alt_source).first
      expect(mod2).to_not be_nil
    end
  end
end
