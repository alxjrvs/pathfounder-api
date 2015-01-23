require "rails_helper"

describe SkillList do
  before do
    @skill_list = create :skill_list
  end

  SkillList::SKILLS.each do |sk|
    describe "#{sk}_details" do
      it "is not null" do
        expect(@skill_list.send("#{sk}_details")).to_not be_nil
      end
    end
  end
end
