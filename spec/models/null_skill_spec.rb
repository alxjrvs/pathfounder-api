require 'rails_helper'

describe NullSkill do
  before do
    @skill = NullSkill.new
  end

  describe '.name' do
    it "returns an empty string" do
      expect(@skill.name).to eq ""
    end
  end
  
  describe '.value' do
    it "returns a zero" do
      expect(@skill.value).to eq 0
    end
  end

  describe "calculated_value" do
    it "returns a zero" do
      expect(@skill.calculated_value).to eq 0
    end
  end

  describe ".list" do
    it "returns a NullSkillList" do
      expect(@skill.list.class).to eq NullSkillList
    end
  end

  describe ".skill_name" do
    it "returns nil" do
      expect(@skill.skill_name).to be_nil
    end
  end

  describe ".armor_check_penalty" do
    it "returns nil" do
      expect(@skill.armor_check_penalty).to be_nil
    end
  end

  describe ".key_stat" do
    it "returns nil" do
      expect(@skill.key_stat).to be_nil
    end
  end

  describe ".custom" do
    it "returns nil" do
      expect(@skill.custom).to be_nil
    end
  end

  describe ".untrained" do
    it "returns nil" do
      expect(@skill.untrained).to be_nil
    end
  end

  describe "nil?" do
    it "is true" do
      expect(@skill).to be_nil
    end
  end
end
