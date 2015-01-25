require 'rails_helper'

describe NullCharacter do
  before do
    @character = NullCharacter.new
  end

  describe ".stat_block" do
    it "returns a NullStatBlock" do
      expect(@character.stat_block.class).to eq NullStatBlock
    end
  end

  describe ".stats" do
    it "returns a NullStatBlock" do
      expect(@character.stat_block.class).to eq NullStatBlock
    end
  end

  describe ".favored_class" do
    it "returns a NullPfClass" do
      expect(@character.favored_class.class).to eq NullPfClass
    end
  end

  describe ".allowed_alignments" do
    it "returns an empty array" do
      expect(@character.allowed_alignments).to eq []
    end
  end

  describe ".class_skills" do
    it "returns an empty array" do
      expect(@character.class_skills).to eq []
    end
  end

  describe ".nil?" do
    it "is true" do
      expect(@character).to be_nil
    end
  end
end
