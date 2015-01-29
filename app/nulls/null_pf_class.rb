class NullPfClass
  include Null

  Character::CLASS_DELEGATES.each do |m|
    define_method m do
      0
    end
  end

  def alignment
    :any
  end

  def additions
    []
  end

  def skill_ranks_per_level
    0
  end

  def base_attack_bonus
    0
  end

  def class_skills
    []
  end

  def mods
    []
  end

  def skills
    []
  end
end
