require "rails_helper"

describe NullPfClass do
  before do
    @class = NullPfClass.new
  end

  it 'is nil' do
    expect(@class).to be_nil
  end

  describe ".class_skills" do
    it 'returns an empty array' do
      expect(@class.class_skills).to eq []
    end
  end

  Character::CLASS_DELEGATES.each do |cd|
    describe ".#{cd}" do
      it 'reports null' do
        expect(@class.send(cd)).to be_nil
      end
    end
  end
end
