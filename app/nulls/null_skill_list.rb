class NullSkillList
  include Null
  Skills::ALL.each do |sk|
    define_method sk do
      NullSkill.new
    end
  end
end
