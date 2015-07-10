require "rails_helper"

describe Deity do
  describe ".allowed_alignments" do
    describe "for :chaotic_neutral" do
      before do
        @deity = Deity.new("Tengu")
      end

      it "should return correct alignments" do
        expect(@deity.allowed_alignments).to contain_exactly(:chaotic_good, :chaotic_neutral,
                                                             :chaotic_evil, :true_neutral)
      end
    end

    describe "for :true_neutral" do
      before do
        @deity = Deity.new("Lady of Graves")
      end

      it "should return all neutral alignments" do
        expect(@deity.allowed_alignments).to contain_exactly(:neutral_good, :neutral_evil,
                                                             :lawful_neutral, :chaotic_neutral,
                                                             :true_neutral)
      end
    end
  end
end
