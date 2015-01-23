class SkillDetailer
  attr_accessor :skill

  def initialize(skill)
    @skill = skill
  end

  def get_details
    SkillDetail.new(skill_hash)
  end

  private

  def skill_hash
    @_skill_hash ||= Skills::DETAILS[skill]
  end

  class SkillDetail
    attr_accessor :name, :untrained, :armor_check_penalty, :key_ability

    def initialize(name: name, untrained: untrained,
      armor_check_penalty: armor_check_penalty,
      key_ability: key_ability)
      @name = name
      @untrained = untrained
      @armor_check_penalty = armor_check_penalty
      @key_ability = key_ability
    end
  end
end
