class NullSkillList
  Skills::ALL.each do |sk|
    define_method sk do
      NullSkill.new
    end
  end

  def nil?
    true
  end
end
