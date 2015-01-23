require "rails_helper"

describe NullFavoredClass do
  before do
    @class = NullFavoredClass.new
  end

  it 'is nil' do
    expect(@class).to be_nil
  end

  Character::CLASS_DELEGATES.each do |cd|
    describe ".#{cd}" do
      it 'reports null' do
        expect(@class.send(cd)).to be_nil
      end
    end
  end
end
