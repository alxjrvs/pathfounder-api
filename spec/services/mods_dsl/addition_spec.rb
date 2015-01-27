require 'rails_helper'

describe ModsDsl::Addition do

  describe '.initialize' do
    before do
      @addition = ModsDsl::Addition.new(category: :armor_proficiency, values: [:simple], source: nil)
    end
    describe ".category" do
      it "returns the category" do
        expect(@addition.category).to eq :armor_proficiency
      end
    end

    describe ".values" do
      it "returns the array of values" do
        expect(@addition.values).to eq [:simple]
      end
    end
  end
end
