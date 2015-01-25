class Skill
  attr_reader :skill_name, :untrained, :key_stat, :custom, :list

  def initialize(options, list)
    @skill_name = options[:name]
    @untrained = options[:untrained]
    @key_stat= options[:key_stat]
    @custom = options[:custom]
    @list = list
  end

  def name
    if custom
      "#{list.send(name_column)}"
    else
      skill_name
    end
  end

  def calculated_value
    @_calculated_value ||= modifier_calculator.total
  end

  def value
    list.send(value_column)
  end

  private

  def character
    @_character ||= begin
      if @list.character
        @list.character
      else
        NullCharacter.new
      end
    end
  end

  def modifier_calculator
    SkillModifierCalculator.new name: skill_name,
      class_skills: character.class_skills,
      value: value,
      penalty: penalty,
      modifier: modifier
  end

  def penalty
    if penalty_applies
      character.armor_check_penalty
    else
      0
    end
  end

  def penalty_applies
    key_stat == :dexterity || key_stat == :strength
  end

  def modifier
    character.send(key_stat).modifier
  end

  def value_column
    "#{skill_name}_val"
  end

  def name_column
    "#{skill_name}_name"
  end
end
