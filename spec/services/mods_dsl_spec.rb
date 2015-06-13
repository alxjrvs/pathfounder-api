require 'rails_helper'

describe ModsDsl do
  class Unicorn
    include ModsDsl
    role :dummy
    hit_die 10
    alignment :any

    class_skills :climb, :craft, :handle_animal
    skill_ranks_per_level 2

    languages [:common], high: [:all_regular]

    size :medium
    speed :normal

    base_attack_bonus      1
    mods feat_count:       1, name: "Bonus Feat"
    mods fortitude_save:  -2
    mods will_save:        0
    mods reflex_save:      0

    adds weapon_proficiency: [:simple, :martial]
    adds armor_proficiency: [:all]
    adds shield_proficiency: [:all]

    special :favored_enemy_gazeebo
    special :special_eyes

  end

  before do
    @class = Unicorn.new
  end

  describe ".mods" do
    before do
      @will = :will_save
      @fort = :fortitude_save
      @reflex = :reflex_save
      @feat = :feat_count
    end

    it 'contains the correct array of modified values' do
      expect(@class.mods.map(&:trait)).to contain_exactly @will, @fort, @reflex, @feat
    end
  end

  describe ".specials" do
    it "reports all the specials" do
      expect(@class.specials).to contain_exactly :favored_enemy_gazeebo, :special_eyes
    end
  end

  describe ".base_attack_bonus" do
    it "reports the base attack bonus" do
      expect(@class.base_attack_bonus).to eq 1
    end
  end

  describe ".alignment" do
    it "reports alignment" do
      expect(@class.alignment).to eq :any
    end
  end

  describe ".speed" do
    it "returns the speed" do
      expect(@class.speed).to eq :normal
    end
  end

  describe ".size" do
    it "returns the size" do
      expect(@class.size).to eq :medium
    end
  end

  describe ".size_modifier" do
    it "returns the size_modifier" do
      expect(@class.size_modifier).to eq SizeModifiers::MOD[@class.size]
    end
  end

  describe ".class_skills" do
    it 'reports class_skills' do
      expect(@class.class_skills).to contain_exactly :climb, :handle_animal, :craft
    end
  end

  describe ".hit_die" do
    it 'reports hit die' do
      expect(@class.hit_die).to eq 10
    end
  end

  describe ".skill_ranks_per_level" do
    it 'reports skill ranks per level' do
      expect(@class.skill_ranks_per_level).to eq 2
    end
  end

  describe ".role" do
    it 'reports role' do
      expect(@class.role).to eq :dummy
    end
  end
end
