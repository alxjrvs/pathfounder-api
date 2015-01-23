module ModsDsl
  def self.included(base)
    base.extend(ModsDslClassMethods)
  end

  def normalize
    unless normalized?
      normalize_mods
    end
  end

  def alignment
    self.class.alignment_val
  end

  def base_attack_bonus
    self.class.base_attack_bonus_val
  end

  def additions
    self.class.additions_array
  end

  def hit_die
    self.class.hit_die_val
  end

  def skills
     self.class.skills_array
  end

  def skill_ranks_per_level
    self.class.skill_ranks_per_level_val
  end

  def role
    self.class.role_val
  end

  def mods_array
    self.class.mods_array
  end

  private

  def normalize_mods
    ModsDsl::ModNormalizer.new(mods_array, source: self).normalize
  end

end
