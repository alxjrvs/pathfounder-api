class NullSkill
  include Null

  def name
    ""
  end

  def value
    0
  end

  def calculated_value
    0
  end

  def list
    NullSkillList.new
  end

  def skill_name
    nil
  end

  def armor_check_penalty
    nil
  end

  def key_stat
    nil
  end

  def custom
    nil
  end

  def untrained
    nil
  end
end
