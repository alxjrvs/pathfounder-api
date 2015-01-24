require "rails_helper"

describe SkillList do
  before do
    @skill_list = create :skill_list
  end

  Skills::ALL.each do |sk|
    describe "#{sk}" do
      it "returns a skill object" do
        skill = @skill_list.send(sk)
        expect(skill.class).to eq Skill
      end
    end
  end
end
