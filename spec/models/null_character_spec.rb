require 'rails_helper'

describe NullCharacter do
  before do
    @character = NullCharacter.new
  end

  describe "nil?" do
    it "is true" do
      expect(@character).to be_nil
    end
  end
end
