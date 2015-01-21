require 'rails_helper'

class DummyClass
  include ModsDsl
  attr_accessor :normalized

  role :dummy
  hit_die 10
  alignment :any

  skills :climb, :craft, :handle_animal
  skill_ranks_per_level 2

  base_attack_bonus      1
  mods feat_count:       1
  mods fortitude_save:  -2
  mods will_save:        0
  mods reflex_save:      0

  adds weapon_proficiency: [:simple, :martial]
  adds armor_proficiency: [:all]
  adds shield_proficiency: [:all]

  def normalized?
    normalized
  end
end

describe ModsDsl do
  before do
    @class = DummyClass.new
  end

  describe ".mods" do
    before do
      @expected_will =
        {role: :dummy, trait: :will_save, modifier: 0}
      @expected_reflex =
        {role: :dummy, trait: :reflex_save, modifier: 0}
      @expected_fort =
        {role: :dummy, trait: :fortitude_save, modifier: -2}
      @expected_feat =
        {role: :dummy, trait: :feat_count, modifier: +1}
    end

    it 'contains the correct array of modified values' do
      expect(@class.mods).to contain_exactly @expected_will,
        @expected_fort,
        @expected_reflex,
        @expected_feat
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

  describe ".skills" do
    it 'reports skills' do
      expect(@class.skills).to contain_exactly :climb, :handle_animal, :craft
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

  describe ".additions" do
    it "reports the additoions" do
      expect(@class.additions[0][:weapon_proficiency]).to contain_exactly(:simple, :martial)
      expect(@class.additions[1][:armor_proficiency]).to contain_exactly :all
      expect(@class.additions[2][:shield_proficiency]).to contain_exactly :all
    end
  end

  describe ".role" do
    it 'reports role' do
      expect(@class.role).to eq :dummy
    end
  end

  describe ".normalize" do
    describe 'when already normalized' do
      before do
        @class.normalized = true
      end

      it 'skips noramlizing' do
        expect{@class.normalize}.to change{Mod.count}.by 0
      end
    end

    describe "when not yet normalized" do
      before do
        @class.normalized = false
      end
      it 'normalizes the modifiables' do
        expect{@class.normalize}.to change{Mod.count}.by 4
      end
    end
  end
end
