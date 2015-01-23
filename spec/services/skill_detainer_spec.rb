require "rails_helper"

describe SkillDetailer do
  describe "get_context" do
    before do
      skill_detailer = SkillDetailer.new(:acrobatics)
      @details = skill_detailer.get_details
    end

    it 'returns a hash of details for the given skill' do
      expect(@details.class).to eq SkillDetailer::SkillDetail
      expect(@details.name).to eq :acrobatics
      expect(@details.untrained).to be_truthy
      expect(@details.armor_check_penalty).to be_truthy
      expect(@details.key_ability).to eq :dexterity
    end
  end
end
