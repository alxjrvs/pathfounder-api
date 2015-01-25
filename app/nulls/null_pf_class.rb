class NullPfClass
  Character::CLASS_DELEGATES.each do |m|
    define_method m do
      0
    end
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

  def nil?
    true
  end
end
