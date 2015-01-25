require 'rails_helper'

describe SkillModifierCalculator do
  describe ".total" do
    describe "with a class skill" do
      before do
        @calc = SkillModifierCalculator.new value: 1,
          name: :acrobatics,
          class_skills: [],
          modifier: 1
      end

      it "totals the sum + modifier" do
        expect(@calc.total).to eq 2
      end
    end

    describe "with no class skill" do
      before do
        @calc = SkillModifierCalculator.new value: 1,
          name: :acrobatics,
          class_skills: [:acrobatics],
          modifier: 1
      end

      it "totals the sum + modifier + 3" do
        expect(@calc.total).to eq 5
      end
    end
  end
end
