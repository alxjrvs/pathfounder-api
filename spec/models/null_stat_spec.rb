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
    it "returns nil" do
      expect(@stat.name).to be_nil
    end
  end

  describe ".value" do
    it "returns nil" do
      expect(@stat.name).to be_nil
    end
  end

  describe ".modifier" do
    it "returns nil" do
      expect(@stat.name).to be_nil
    end
  end
end
