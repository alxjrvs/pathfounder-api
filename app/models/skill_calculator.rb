class SkillCalculator

  def initialize(skill_list, stats, modifiers, ac_penalty, class_skills)
    @skill_list = skill_list
    @stats = stats
    @modifiers = modifiers
    @ac_penalty = ac_penalty
    @class_skills = class_skills
  end

  Skills::ALL.each do |sk|
    define_method "#{sk}" do
      options = Skills::DETAILS[sk]
      Skill.new(options, skill_list, stats, modifiers, ac_penalty, class_skills )
    end
  end

  private
  attr_reader :skill_list, :stats, :modifiers, :ac_penalty, :class_skills
end
