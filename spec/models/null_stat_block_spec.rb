require 'rails_helper'

describe NullStatBlock do
  before do
    @class = NullStatBlock.new
  end

  it 'is nil' do
    expect(@class).to be_nil
  end

  StatBlock::STATS.each do |s|
    describe ".#{s}" do
      it 'reports null' do
        expect(@class.send(s)).to be_nil
      end
    end
    describe ".#{s}_mod" do
      it 'reports null' do
        expect(@class.send("#{s}_mod")).to be_nil
      end
    end
  end
end
