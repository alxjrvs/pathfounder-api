require 'rails_helper'

describe Fighter do
  describe 'ModsDSL values' do
    let(:fighter) { Fighter.new }
    describe 'role' do
      it 'has a role of :class' do
        expect(fighter.role).to eq :class
      end
    end

    describe '.hit_die' do
      it 'equals 10' do
        expect(fighter.hit_die).to eq 10
      end
    end

    describe '.allowed_alignment' do
      it "allows for any alignment" do
        expect(fighter.alignment).to eq :any
      end
    end

    describe ".class_skills" do
      it "equals the right class skills" do
        expect(fighter.class_skills).to contain_exactly :climb, :craft, :handle_animal
      end
    end

    describe ".skill_ranks_per_level" do
      it 'equals 2' do
        expect(fighter.skill_ranks_per_level).to eq 2
      end
    end

    describe ".base_attack_bonus" do
      it 'equals 1' do
        expect(fighter.base_attack_bonus).to eq 1
      end
    end

    describe ".adds" do
      it 'has 3 adds' do
        expect(fighter.additions.count).to eq 3
      end
    end

    describe ".mods" do
      it 'has 3 mods' do
        expect(fighter.mods.count).to eq 3
      end
    end

    describe "specials" do
      it 'has one special' do
        expect(fighter.specials.count).to eq 1
      end
    end
  end
end
