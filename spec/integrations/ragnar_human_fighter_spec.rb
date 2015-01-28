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
      @feats = create :feat_list, character: @ragnar
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
      expect(@ragnar.acrobatics.value).to eq 4
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

    it "has an initiative bonus" do
      expect(@ragnar.initiative_bonus).to eq 1
    end

    it "has armor proficiencies" do
      expect(@ragnar.armor_proficiencies).to contain_exactly :all
    end

    it "has shielf proficiencies" do
      expect(@ragnar.shield_proficiencies).to contain_exactly :all
    end

    it "has weapon proficiencies" do
      expect(@ragnar.weapon_proficiencies).to contain_exactly :simple, :martial
    end

    it "has language options" do
      expect(@ragnar.starting_language_options).to contain_exactly :common
      expect(@ragnar.high_intelligence_language_options).to contain_exactly :all_regular
    end

    it "has an AC" do
      expect(@ragnar.armor_class).to eq 11
    end

    it "has a ranged attack bonus" do
      expect(@ragnar.ranged_attack_bonus).to eq 2
    end

    it "has a melee attack bonus" do
      expect(@ragnar.melee_attack_bonus).to eq 5
    end

    it "has a speed" do
      expect(@ragnar.speed).to eq :normal
    end

    it "has a size" do
      expect(@ragnar.size_modifier).to eq 0
    end

    it "has a size" do
      expect(@ragnar.size).to eq :medium
    end

    it "has a feat" do
      expect(@ragnar.feats.count).to eq 1
    end
  end
end
