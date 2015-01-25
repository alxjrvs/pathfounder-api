class SkillModifierCalculator
  def initialize(name: name,
                 value: value,
                 class_skills: class_skills,
                 modifier: modifier,
                 penalty: penalty)
    @name = name
    @value = value
    @class_skills = class_skills
    @modifier = modifier
    @penalty = penalty
  end

  def total
    value + class_skill_bonus + modifier + penalty
  end

  private

  attr_reader :name, :value, :class_skills, :modifier, :penalty

  def class_skill_bonus
    if class_skill?
      3
    else
      0
    end
  end

  def class_skill?
    class_skills.include? name
  end
end
