require 'rails_helper'

describe NulLRace do
  before do
    @race = NullRace.new
  end

  describe ".mods" do
    it 'returns an empty array' do
      expect(@race.mods).to eq []
    end
  end
end
