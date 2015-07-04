require 'rails_helper'

describe SkillCalculator do
  let(:skill_list) { create :skill_list }
  let(:stat_block) { create :stat_block, character: skill_list.character }
  let(:stats) { StatCalculator.new stat_block: stat_block, mods: ModIndexer.new([]) }
  let(:modifiers) { ModIndexer.new [] }
  let(:skill_calculator) { SkillCalculator.new(skill_list, stats, modifiers, 0, []) }

  Skills::ALL.each do |skill|
    describe ".#{skill}" do
      it "returns a skill object" do
        expect(skill_calculator.send(skill)).to be_a Skill
      end
    end
  end
end
