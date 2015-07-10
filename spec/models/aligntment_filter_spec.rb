require "rails_helper"

describe AlignmentFilter do
  describe ".remaining_options" do
    describe "with :any alignment" do
      before do
        @filter = AlignmentFilter.new(:any)
      end

      it 'returns all alignemnts' do
        expect(@filter.remaining_options).to eq AlignmentFilter::ALIGNMENTS
      end
    end

    describe "with nil" do
      before do
        @filter = AlignmentFilter.new(nil)
      end

      it 'returns all alignemnts' do
        expect(@filter.remaining_options).to eq AlignmentFilter::ALIGNMENTS
      end
    end

    describe "with a specific value" do
      describe "good" do
        before do
          @filter = AlignmentFilter.new(:good)
        end

        it 'returns all matching ' do
          expect(@filter.remaining_options).to contain_exactly(:lawful_good, :chaotic_good, :neutral_good)
        end
      end

      describe "chaotic" do
        before do
          @filter = AlignmentFilter.new(:chaotic)
        end

        it 'returns all matching ' do
          expect(@filter.remaining_options).to contain_exactly(:chaotic_neutral, :chaotic_good, :chaotic_evil)
        end
      end
    end

    describe "using 'not'" do
      describe "evil" do
        before do
          @filter = AlignmentFilter.new(:not_evil)
        end

        it "doesn't return evil alignments" do
          expect(@filter.remaining_options).to contain_exactly(:lawful_good, :lawful_neutral, :chaotic_good,
                                                       :chaotic_neutral, :true_neutral, :neutral_good)
        end
      end

      describe "chaotic" do
        before do
          @filter = AlignmentFilter.new(:not_chaotic)
        end

        it "doesn't return chaotic alignments" do
          expect(@filter.remaining_options).to contain_exactly(:lawful_good, :lawful_evil, :lawful_neutral,
                                                       :true_neutral, :neutral_good, :neutral_evil)
        end
      end
    end

    describe "for cleric" do
      describe "with a chaotic_evil deity" do
        before do
          @deity = Deity.new("Azathoth")
          @filter = AlignmentFilter.new(:matches_deity, @deity)
        end

        it "should return correct alignments" do
          expect(@filter.remaining_options).to contain_exactly(:chaotic_good, :chaotic_neutral,
                                                               :chaotic_evil, :true_neutral)
        end
      end
    end
  end
end
