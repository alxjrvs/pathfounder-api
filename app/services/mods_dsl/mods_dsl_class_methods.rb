module ModsDsl::ModsDslClassMethods
  attr_accessor :role_val, :hit_die_val,
    :skill_ranks_per_level_val, :alignment_val,
    :base_attack_bonus_val, :size_val, :speed_val,
    :starting_languages_val, :high_intelligence_languages_val

  def base_attack_bonus(val)
    self.base_attack_bonus_val = val
  end

  def alignment(val)
    self.alignment_val = val
  end

  def size(val)
    self.size_val = val
  end

  def speed(val)
    self.speed_val = val
  end

  def role(val)
    self.role_val= val
  end

  def hit_die(val)
    self.hit_die_val = val
  end

  def skill_ranks_per_level(val)
    self.skill_ranks_per_level_val = val
  end
end
