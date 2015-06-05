class SkillModifierCalculator
  def initialize(name:, value:, class_skills:, bonuses:, modifier:, penalty:)
    @name = name
    @value = value
    @class_skills = class_skills
    @bonuses = bonuses
    @modifier = modifier
    @penalty = penalty
  end

  def total
    value +
      class_skill_bonus +
      modifier +
      penalty +
      bonuses
  end

  private

  attr_reader :name, :value, :class_skills, :modifier, :penalty, :bonuses

  def class_skill_bonus
    return 3 if class_skill?
    0
  end

  def search_name
    return :craft if name.to_s.match "craft"
    return :perform if name.to_s.match "perform"
    return :profession if name.to_s.match "profession"
    return name
  end

  def class_skill?
    class_skills.include? search_name
  end
end
