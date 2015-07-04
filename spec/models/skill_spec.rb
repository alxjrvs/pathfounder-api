require "rails_helper"

describe Skill do
  let(:skill_list) { create :skill_list }
  let(:stat_block) { create :stat_block, character: skill_list.character }
  let(:stats) { StatCalculator.new stat_block: stat_block, mods: ModIndexer.new([]) }
  let(:modifiers) { ModIndexer.new [] }

  describe 'Custom Skills' do
    before do
      options = Skills::DETAILS[:craft_1]
      @skill = Skill.new(options, skill_list, stats, modifiers, 0, [])
    end

    describe ".name" do
      it "returns the custom name for the skill" do
        expect(@skill.name).to eq skill_list.craft_1_name
      end
    end

    describe ".value" do
      it "it returns an integer" do
        expect(@skill.value.class).to eql Fixnum
      end
    end

    describe ".point_value" do
      it "returns the value on the list for the given skill" do
        expect(@skill.point_value).to eq skill_list.craft_1_val
      end
    end
  end

  describe "Generic Skills" do
    before do
      options = Skills::DETAILS[:acrobatics]
      @skill = Skill.new(options, skill_list, stats, modifiers, 0, [])
    end
    describe ".name" do
      it "returns the custom name for the skill" do
        expect(@skill.name).to eq @skill.skill_name
      end
    end

    describe ".value" do
      it "returns the value on the list for the given skill" do
        expect(@skill.value).to be_a Fixnum
      end
    end
  end
end
