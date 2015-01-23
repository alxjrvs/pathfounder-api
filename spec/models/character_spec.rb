require 'rails_helper'

describe Character do
  before do
    @character = create :character
  end

  describe "favored_class" do
    describe "with a class" do
      before do
        @level = create :level, character: @character
      end

      it "can have the correct associations" do
        expect(@character.favored_class).to eq @level.pf_class
      end
    end

    describe "without a class" do
      it "should return nil" do
        expect(@character.favored_class).to be_nil
      end
    end
  end
end
