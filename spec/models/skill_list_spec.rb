require "rails_helper"

describe SkillList do
  before do
    @skill_list = create :skill_list
  end

  describe ".find" do
    before do
      @skill = @skill_list.find(:acrobatics)
    end

    it 'returns a specific skill' do
      expect(@skill.class).to eq Skill
      expect(@skill.name).to eq :acrobatics
    end
  end

  describe ".all_skills" do
    before do
      @array = @skill_list.all_skills
    end

    it "returns an array of all the skill objects" do
      skill_count = Skills::ALL.length
      expect(@array.length).to eq skill_count
    end
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
