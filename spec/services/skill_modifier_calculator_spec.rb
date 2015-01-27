require 'rails_helper'

describe SkillModifierCalculator do
  describe ".total" do
    describe "with a penalty" do
      before do
        @calc = SkillModifierCalculator.new value: 1,
          name: :acrobatics,
          penalty: -2,
          bonuses: 1,
          class_skills: [],
          modifier: 1
      end

      it "totals the sum + the penalty" do
        expect(@calc.total).to eq 1
      end
    end

    describe "without a class skill" do
      before do
        @calc = SkillModifierCalculator.new value: 1,
          name: :acrobatics,
          penalty: 0,
          bonuses: -1,
          class_skills: [],
          modifier: 1
      end

      it "totals the sum + modifier" do
        expect(@calc.total).to eq 1
      end
    end

    describe "with a class skill" do
      before do
        @calc = SkillModifierCalculator.new value: 1,
          name: :acrobatics,
          penalty: 0,
          class_skills: [:acrobatics],
          bonuses: 0,
          modifier: 1
      end

      it "totals the sum + modifier + 3" do
        expect(@calc.total).to eq 5
      end
    end
  end
end
