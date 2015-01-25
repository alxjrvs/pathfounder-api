class NullPfClass
  Character::CLASS_DELEGATES.each do |m|
    define_method m do
      nil
    end
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
