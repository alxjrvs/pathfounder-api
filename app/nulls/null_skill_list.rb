class NullSkillList
  include Null
  Skills::ALL.each do |sk|
    define_method sk do
      NullSkill.new
    end
  end

  def find(key)
    NullSkill.new
  end

  def all_skills
    []
  end
end
