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

  def languages(start, high: high)
    ModsDsl::Addition.new category: :starting_languages, values: start if start.present?
    ModsDsl::Addition.new category: :high_intelligence_languages, values: high if high.present?
  end

  def hit_die(val)
    self.hit_die_val = val
  end

  def skill_ranks_per_level(val)
    self.skill_ranks_per_level_val = val
  end

  def adds(hash)
    category = hash.keys.first
    values = hash.values.first
    ModsDsl::Addition.new category: category, values: values, source: source
    additions_array.push(hash)
  end

  def class_skills(*args)
    args.each do |arg|
      class_skills_array.push(arg)
    end
  end

  def mods(hash)
    trait = hash.keys.first
    modifier = hash.values.first
    init = {role: role_val, trait: trait, modifier: modifier}
    mod = ModsDsl::Mod.new(init, source)
    mods_array.push mod
  end

  def source
    @_source ||= ModsDsl::Source.new(self, self.role_val)
  end

  def mods_array
    @_mods_array ||= []
  end

  def class_skills_array
    @_class_skills_array ||= []
  end

  def additions_array
    @_additions_array ||= []
  end
end
