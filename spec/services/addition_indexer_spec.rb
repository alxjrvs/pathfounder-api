require 'rails_helper'

describe AdditionIndexer do
  before do
    @add_1 = ModsDsl::Addition.new(category: :foo, values: [:three])
    @add_2 = ModsDsl::Addition.new(category: :foo, values: [:one, :two])
    @add_3 = ModsDsl::Addition.new(category: :bar, values: [:a])
    @adds = [@add_1, @add_2, @add_3]
    @indexer = AdditionIndexer.new @adds
  end
  describe ".total_values_for" do
    it "returns the total values for a category" do
      expect(@indexer.total_values_for(:foo)).to contain_exactly :one, :two, :three
    end
  end

  describe "find_by_category" do
    it 'returns all mods with a given trait' do
      expect(@indexer.find_by_category(:foo).count).to eq 2

    end
    it "accepts strings" do
      expect(@indexer.find_by_category("foo").count).to eq 2
    end

  end
end
