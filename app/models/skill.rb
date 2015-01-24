class Skill
  attr_reader :skill_name, :untrained, :armor_check_penalty, :key_ability, :custom, :list
  def initialize(options, list)
    @skill_name = options[:name]
    @untrained = options[:untrained]
    @armor_check_penalty = options[:armor_check_penalty]
    @key_ability = options[:key_ability]
    @custom = options[:custom]
    @list = list
  end

  def name
    if custom
      list.send(name_column)
    else
      skill_name
    end
  end

  def value
    list.send(value_column)
  end

  def update_value(val)
    list.update_attributes(value_column => val)
  end

  private

  def value_column
    "#{skill_name}_val"
  end

  def name_column
    "#{skill_name}_name"
  end

end
