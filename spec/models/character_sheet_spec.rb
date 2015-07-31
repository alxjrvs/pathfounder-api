require "rails_helper"

describe CharacterSheet do
  describe "For a first Level Human Fighter" do
    let!(:character) { create :character }
    let!(:race) { create :human, character: character }
    let!(:klass) { create :fighter }
    let!(:level) { create :level, pf_class: klass, character: character}
    let!(:stats) { create :stat_block, character: character }
    let!(:skills) { create :skill_list, character: character }
    let!(:feats) { create :feat_list, character: character }
    let!(:armory) { create :armory, character: character }
    let!(:sheet) { CharacterSheet.new(character) }

    describe "with cosmetic details" do
      it "has a #name" do
        expect(sheet.name).to eql "Ragnar"
      end

      it "has a level" do
        expect(sheet.level).to eql 1
      end

      it "has an alignment" do
        expect(sheet.alignment).to eql "Chaotic Good"
      end

      it "can be any aligntment" do
        expect(sheet.allowed_alignments.count).to eq AlignmentFilter::ALIGNMENTS.count
      end

    end

    describe "Saves" do
      it "has a reflex save" do
        expect(sheet.reflex_save).to eq 1
      end

      it "has a will save" do
        expect(sheet.will_save).to eq(-2)
      end

      it "has a fortitude save" do
        expect(sheet.fortitude_save).to eq 0
      end

    end

    describe "Feat" do
      it "has a number of available feats" do
        expect(sheet.feat_count).to eq 3
      end
    end

    describe "Additional Details" do
      it "has language options" do
        expect(sheet.starting_language_options).to contain_exactly :common
        expect(sheet.high_intelligence_language_options).to contain_exactly :all_regular
      end

      it "has armor proficiencies" do
        expect(sheet.armor_proficiencies).to contain_exactly :all
      end

      it "has shield proficiencies" do
        expect(sheet.shield_proficiencies).to contain_exactly :all
      end

      it "has weapon proficiencies" do
        expect(sheet.weapon_proficiencies).to contain_exactly :simple, :martial
      end
    end

    describe "Race" do
      it "has a #race" do
        expect(sheet.race).to eql race
      end

      it "has a speed" do
        expect(sheet.speed).to eq :normal
      end

      it "has a size" do
        expect(sheet.size_modifier).to eq 0
      end

      it "has a size" do
        expect(sheet.size).to eq :medium
      end

    end
    describe "Favored Class" do
      it "has a #favored_class" do
        expect(sheet.favored_class).to eql klass
      end

      it "has skill ranks per level" do
        expect(sheet.skill_ranks_per_level).to eq 2
      end


      it "has a base attack bonus" do
        expect(sheet.base_attack_bonus).to eq 1
      end

      it "has a hit die" do
        expect(sheet.hit_die).to eq 10
      end
    end

    describe "Stats" do
      it "has correctly calculated stats" do
        expect(sheet.stats.intelligence.value).to eq 11
        expect(sheet.stats.wisdom.value).to eq 7
        expect(sheet.stats.charisma.value).to eq 13
        expect(sheet.stats.strength.value).to eq 18
        expect(sheet.stats.dexterity.value).to eq 12
        expect(sheet.stats.constitution.value).to eq 14
      end

      it "has correctly calculated mods" do
        expect(sheet.stats.intelligence.modifier).to eq 0
        expect(sheet.stats.wisdom.modifier).to eq(-2)
        expect(sheet.stats.charisma.modifier).to eq 1
        expect(sheet.stats.strength.modifier).to eq 4
        expect(sheet.stats.dexterity.modifier).to eq 1
        expect(sheet.stats.constitution.modifier).to eq 2
      end
    end

    describe "Skills" do
      it "has correctly calculated skill values" do
        expect(sheet.skills.acrobatics.value).to eq 4
        expect(sheet.skills.craft_1.value).to eq 4
      end
    end

    describe "Combat" do
      it "has an AC" do
        expect(sheet.combat.armor_class).to eq 11
      end

      it "has an initiative bonus" do
        expect(sheet.combat.initiative_modifier).to eq 1
      end

      it "has a ranged attack bonus" do
        expect(sheet.combat.ranged_attack_bonus).to eq 2
      end

      it "has a melee attack bonus" do
        expect(sheet.combat.melee_attack_bonus).to eq 5
      end
    end

    describe "Armory" do
      it "has weapons and armor" do
        expect(sheet.armory.melee_weapon).to eq "dogslicer"
        expect(sheet.armory.ranged_weapon).to eq "sling"
        expect(sheet.armory.armor).to eq "padded"
      end
    end
  end
end
