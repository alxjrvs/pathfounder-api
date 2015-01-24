require "rails_helper"

describe Skill do
  before do 
    @list = create :skill_list
  end
  describe 'Custom Skills' do
    before do
      options = Skills::DETAILS[:craft_1]
      @skill = Skill.new(options, @list)
    end

    describe ".name" do
      it "returns the custom name for the skill" do
        expect(@skill.name).to eq @list.craft_1_name
      end
    end

    describe ".value" do
      it "returns the value on the list for the given skill" do
        column = "#{@skill.skill_name}_val"
        expect(@skill.value).to eq @list.send(column)
      end
    end

    describe ".update_value" do
      before do
        @skill.update_value(2)
        @list.reload
      end
      it "updates the value on the associated list" do
        column = "#{@skill.skill_name}_val"
        expect(@list.send(column)).to eq 2
      end
    end
  end
  describe "Generic Skills" do
    before do
      options = Skills::DETAILS[:acrobatics]
      @skill = Skill.new(options, @list)
    end
    describe ".name" do
      it "returns the custom name for the skill" do
        expect(@skill.name).to eq @skill.skill_name
      end
    end

    describe ".value" do
      it "returns the value on the list for the given skill" do
        column = "#{@skill.skill_name}_val"
        expect(@skill.value).to eq @list.send(column)
      end
    end

    describe ".update_value" do
      before do
        @skill.update_value(2)
        @list.reload
      end
      it "updates the value on the associated list" do
        column = "#{@skill.skill_name}_val"
        expect(@list.send(column)).to eq 2
      end
    end
  end
end
