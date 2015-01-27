require 'rails_helper'

describe Character do
  before do
    @character = create :character
  end

  describe ".mods" do
    before do
      @race = create :human, character: @character
      @class = create :fighter, character: @character
      @character.save
    end

    it 'reports the mods from both race and class' do
      length = @race.mods.length + @class.mods.length
      expect(@character.mods.length).to eq length
    end
  end

  describe ".skill_list" do
    describe "with a skill list" do
      before do
        @skill_list = create :skill_list, character: @character
      end

      it "returns the skill list" do
        expect(@character.skill_list).to eq @skill_list
      end
    end

    describe "without a skill_list" do
      it "should return nil" do
        expect(@character.skill_list).to be_nil
      end
    end
  end
  describe ".stat_block" do
    describe "with a stat block" do
      before do
        @stat_block = create :stat_block, character: @character
      end

      it "returns the stat block" do
        expect(@character.stat_block).to eq @stat_block
      end
    end

    describe "without a stat block" do
      it "should return nil" do
        expect(@character.stat_block).to be_nil
      end
    end
  end

  describe ".favored_class" do
    describe "with a class" do
      before do
        @level = create :level, character: @character
      end

      it "can have the correct associations" do
        expect(@character.favored_class).to eq @level.pf_class
      end
    end

    describe "without a class" do
      it "should return nil" do
        expect(@character.favored_class).to be_nil
      end
    end
  end
end
