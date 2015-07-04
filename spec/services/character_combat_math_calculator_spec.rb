require 'rails_helper'

describe CharacterCombatMathCalculator do
  let!(:stat_block) { create :stat_block }
  let!(:character) { stat_block.character }
  let!(:stats) { StatCalculator.new(stat_block: stat_block, mods: ModIndexer.new([]))}
  let!(:mods) { ModIndexer.new [] }
  let(:combat) { CharacterCombatMathCalculator.new(
    mods: mods,
    stats: stats,
    base_attack_bonus: 0,
    armor_bonus: 0,
    shield_bonus: 0,
    size_modifier: 0
    )
  }

  describe ".initiative_modifier" do
    it "calculates the initiative modifier correctly" do
      expect(combat.initiative_modifier).to eq 1
    end
  end

  describe ".melee_attack_bonus" do
    it "calculates the melee_attack_bonus correctly" do
      expect(combat.melee_attack_bonus).to eq 3
    end
  end

  describe ".ranged_attack_bonus" do
    it "calculates the ranged_attack_bonus correctly" do
      expect(combat.ranged_attack_bonus).to eq 1
    end
  end

  describe ".flat_footed" do
    it "calculates the flat_footed correctly" do
      expect(combat.flat_footed).to eq 10
    end
  end

  describe "#armor_class" do
    it "calculates the armor_class correctly" do
      expect(combat.armor_class).to eq 11
    end
  end
end
