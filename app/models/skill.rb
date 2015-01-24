class Skill
  attr_reader :skill_name, :untrained, :armor_check_penalty, :key_stat, :custom, :list
  def initialize(options, list)
    @skill_name = options[:name]
    @untrained = options[:untrained]
    @armor_check_penalty = options[:armor_check_penalty]
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
    @_calculated_value ||= value + class_skill_bonus + modifier
  end

  def value
    list.send(value_column)
  end

  private

  def class_skill?
    character.class_skills.include? skill_name.to_sym
  end

  def modifier
    character.send(key_stat).modifier
  end

  def character
    @_character ||= begin
      if @list.character
        @list.character
      else
        NullCharacter.new
      end
    end
  end

  def value_column
    "#{skill_name}_val"
  end

  def name_column
    "#{skill_name}_name"
  end

end
