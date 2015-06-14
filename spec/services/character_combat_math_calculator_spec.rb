require 'rails_helper'

describe CharacterCombatMathCalculator do
  let!(:character) { create :character }
  let(:combat) { CharacterCombatMathCalculator.new(character) }
  describe ".melee_attack_bonus" do
    it "calculates the melee_attack_bonus correctly" do
      expect(combat.melee_attack_bonus).to eq 0
    end
  end

  describe ".ranged_attack_bonus" do
    it "calculates the ranged_attack_bonus correctly" do
      expect(combat.ranged_attack_bonus).to eq 0
    end
  end

  describe ".flat_footed" do
    it "calculates the flat_footed correctly" do
      expect(combat.ranged_attack_bonus).to eq 0
    end
  end

  describe "#armor_class" do
    it "calculates the armor_class correctly" do
      expect(combat.armor_class).to eq 10
    end
  end
end
