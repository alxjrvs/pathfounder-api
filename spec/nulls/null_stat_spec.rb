require 'rails_helper'

describe NullStat do
  before do
    @stat = NullStat.new
  end

  describe ".nil?" do
    it "returns true" do
      expect(@stat).to be_nil
    end
  end

  describe ".name" do
    it "returns an empty string" do
      expect(@stat.name).to eq ""
    end
  end

  describe ".value" do
    it "returns 0" do
      expect(@stat.value).to eq 0
    end
  end

  describe ".modifier" do
    it "returns 0" do
      expect(@stat.modifier).to eq 0
    end
  end
end
