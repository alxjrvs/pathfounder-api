require 'rails_helper'

describe "Stuart Porrel's" do
  describe "first level character" do
    before do
      @ragnar = create :character, race: nil, name: "Ragnar"
      @race = create :human, character: @ragnar
      @klass = create :fighter
      create :level, pf_class: @klass, character: @ragnar
      @stats = create :stat_block, character: @ragnar
      @skills = create :skill_list, character: @ragnar
    end

    it "is named ragnar" do
      expect(@ragnar.name).to eq "Ragnar"
    end

    it "is a human fighter" do
      expect(@ragnar.favored_class.class).to eq Fighter
      expect(@ragnar.race.class).to eq Human
    end

    it "is level one" do
      expect(@ragnar.level).to be_present
    end

    it "has stats" do
      expect(@ragnar.intelligence.value).to eq 11
      expect(@ragnar.wisdom.value).to eq 7
      expect(@ragnar.charisma.value).to eq 13
      expect(@ragnar.strength.value).to eq 18
      expect(@ragnar.dexterity.value).to eq 12
      expect(@ragnar.constitution.value).to eq 14
    end

    it "has skills" do
      expect(@ragnar.acrobatics.value).to eq 2
      expect(@ragnar.craft_1.value).to eq 4
    end

    it "gets to choose 3 feats at first level" do
      expect(@ragnar.feat_count).to eq 3
    end

    it "has a base attack bonus" do
      expect(@ragnar.base_attack_bonus).to eq 1
    end

    it "has a hit die" do
      expect(@ragnar.hit_die).to eq 10
    end

    it "can be any aligntment" do
      expect(@ragnar.allowed_alignments.count).to eq AlignmentFilter::ALIGNMENTS.count
    end

    it "has armor proficiencies"
    it "has weapon proficiencies"
    it "has languages"
    it "has a speed"
    it "has a size"
  end
end
