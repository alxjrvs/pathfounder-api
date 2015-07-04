class Skill
  include ActiveModel::SerializerSupport
  attr_reader :skill_name, :untrained, :key_stat, :custom, :list, :stats, :modifiers, :ac_penalty, :class_skills

  def initialize(options, list, stats, modifiers, ac_penalty, class_skills)
    @skill_name = options[:name]
    @untrained = options[:untrained]
    @key_stat= options[:key_stat]
    @custom = options[:custom]
    @list = list
    @stats = stats
    @modifiers = modifiers
    @ac_penalty = ac_penalty
    @class_skills = class_skills
  end

  def name
    if custom
      "#{list.send(name_column)}"
    else
      skill_name
    end
  end

  def value
    @_value ||= modifier_calculator.total
  end

  def point_value
    list.send(value_column).to_i
  end

  private

  def modifier_calculator
    @_modifier_calculator ||= begin
      SkillModifierCalculator.new name: skill_name,
        class_skills: class_skills,
        bonuses: bonuses,
        value: point_value,
        penalty: penalty,
        modifier: modifier
    end
  end

  def penalty
    if penalty_applies
      ac_penalty
    else
      0
    end
  end

  def bonuses
    modifiers.total_bonus_for skill_name
  end

  def penalty_applies
    key_stat == :dexterity || key_stat == :strength
  end

  def modifier
    stats.send(key_stat).modifier
  end

  def value_column
    "#{skill_name}_val"
  end

  def name_column
    "#{skill_name}_name"
  end
end
