require "rails_helper"

describe NullPfClass do
  before do
    @class = NullPfClass.new
  end

  it 'is nil' do
    expect(@class).to be_nil
  end

  describe ".class_skills" do
    it 'returns an empty array' do
      expect(@class.class_skills).to eq []
    end
  end

  describe "skills" do
    it 'returns an empty array' do
      expect(@class.class_skills).to eq []
    end
  end

  describe "base_attack_bonus" do
    it 'returns 0' do
      expect(@class.base_attack_bonus).to eq 0
    end
  end

  describe "hit_die" do
    it 'returns 0' do
      expect(@class.hit_die).to eq 0
    end
  end
end
