module ModsDsl
  def self.included(base)
    base.extend(ModsDslClassMethods)
    base.extend(SourceMethods)
    base.extend(ModsMethods)
    base.extend(FeatMethods)
    base.extend(AddsMethods)
    base.extend(ClassSkillsMethods)
  end

  def feats
    self.class.feat_array
  end

  def speed
    self.class.speed_val
  end

  def size
    self.class.size_val
  end

  def alignment
    self.class.alignment_val
  end

  def size_modifier
    SizeModifiers::MOD[size]
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

  def class_skills
     self.class.class_skills_array
  end

  def skill_ranks_per_level
    self.class.skill_ranks_per_level_val
  end

  def role
    self.class.role_val
  end

  def mods
    self.class.mods_array
  end
end
