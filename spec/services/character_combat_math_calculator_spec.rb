require 'rails_helper'

describe CharacterCombatMathCalculator do
  describe "#melee_attack_bonus" do
    it "calculates the melee_attack_bonus correctly" do
      mab = CharacterCombatMathCalculator.melee_attack_bonus base_attack_bonus: 1,
        size_modifier: +1,
        str_mod: 2
      expect(mab).to eq 4
    end
  end
  describe "#ranged_attack_bonus" do
    it "calculates the ranged_attack_bonus correctly" do
      rab = CharacterCombatMathCalculator.ranged_attack_bonus base_attack_bonus: 1,
        size_modifier: +1,
        range_penalty: 0,
        dex_mod: 1
      expect(rab).to eq 3
    end
  end
  describe "#armor_class" do
    it "calculates the armor_class correctly" do
      ac = CharacterCombatMathCalculator.armor_class mods_bonus: 0,
        dex_mod: 1,
        armor_bonus: -1,
        shield_bonus: -2
      expect(ac).to eq 8
    end
  end
end
