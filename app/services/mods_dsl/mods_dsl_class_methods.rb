module ModsDsl::ModsDslClassMethods
  cattr_accessor :role_val, :hit_die_val,
    :skill_ranks_per_level_val, :alignment_val,
    :base_attack_bonus_val

  def base_attack_bonus(val)
    self.base_attack_bonus_val = val
  end

  def alignment(val)
    self.alignment_val = val
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

  def adds(hash)
    additions_array.push(hash)
  end

  def skills(*args)
    args.each do |arg|
      skills_array.push(arg)
    end
  end

  def mods(hash)
    trait = hash.keys.first
    modifier = hash.values.first
    mod_hash = {role: role_val, trait: trait, modifier: modifier}
    mods_array.push mod_hash
  end

  def mods_array
    @_mods_array ||= []
  end

  def skills_array
    @_skills_array ||= []
  end

  def additions_array
    @_additions_array ||= []
  end
end
